import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:poll_dao/src/core/constants/server_constants.dart';
import 'package:poll_dao/src/features/sign_in_page/data/models/sign_in_model.dart';
import 'package:poll_dao/src/features/widget_servers/loger_service/loger.dart';
import 'package:poll_dao/src/features/widget_servers/repositories/storage_repository.dart';
import 'package:poll_dao/src/features/widget_servers/universal_data/universaldata.dart';

class Service {
  final _dio = Dio(
    BaseOptions(
      headers: {"Content-Type": "application/json"},
      connectTimeout: Duration(seconds: TimeOutConstants.connectTimeout),
      receiveTimeout: Duration(seconds: TimeOutConstants.receiveTimeout),
      sendTimeout: Duration(seconds: TimeOutConstants.sendTimeout),
    ),
  );

  ApiService() {
    _init();
  }

  _init() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onError: (error, handler) async {
          debugPrint("ERRORGA TUSHDI:${error.message} and ${error.response}");
          return handler.next(error);
        },
        onRequest: (requestOptions, handler) async {
          debugPrint("SO'ROV YUBORILDI :${requestOptions.path}");
          requestOptions.headers.addAll({"token": StorageRepository.getString("token")});
          return handler.next(requestOptions);
        },
        onResponse: (response, handler) async {
          debugPrint("JAVOB KELDI :${response.requestOptions.path}");
          return handler.next(response);
        },
      ),
    );
  }

  Future<UniversalData> sendLoginRequest({required String email, required String password}) async {
    Response response;
    try {
      response = await _dio.post("http://94.131.10.253:3000/auth/login", data: {
        "email": email,
        'password': password,
      });

      if (response.data["token"] != null) {
        StorageRepository.putString("token", response.data["token"]);
      }
      LoggerService.i("Response=>$response");
      LoggerService.e("Response=>${response.data}");
      return UniversalData(data: SignInModel.fromJson(response.data));
    } on DioException catch (e) {
      return UniversalData(error: e.response!.data.toString());
    } catch (e) {
      return UniversalData(error: e.toString());
    }
  }
}

UniversalData getDioCustomError(DioException exception) {
  debugPrint("DIO ERROR TYPE: ${exception.type}");
  if (exception.response != null) {
    return UniversalData(error: exception.response!.data["message"]);
  }
  switch (exception.type) {
    case DioExceptionType.sendTimeout:
      {
        return UniversalData(error: "sendTimeout");
      }
    case DioExceptionType.receiveTimeout:
      {
        return UniversalData(error: "receiveTimeout");
      }
    case DioExceptionType.cancel:
      {
        return UniversalData(error: "cancel");
      }
    case DioExceptionType.badCertificate:
      {
        return UniversalData(error: "badCertificate");
      }
    case DioExceptionType.badResponse:
      {
        return UniversalData(error: "badResponse");
      }
    case DioExceptionType.connectionError:
      {
        return UniversalData(error: "connectionError");
      }
    case DioExceptionType.connectionTimeout:
      {
        return UniversalData(error: "connectionTimeout");
      }
    default:
      {
        return UniversalData(error: "unknown");
      }
  }
}
