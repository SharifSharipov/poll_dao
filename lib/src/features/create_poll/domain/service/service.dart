import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:poll_dao/src/core/constants/server_constants.dart';
import 'package:poll_dao/src/features/create_poll/data/models/create_poll_model.dart';

import '../../../widget_servers/loger_service/loger.dart';
import '../../../widget_servers/repositories/storage_repository.dart';
import '../../../widget_servers/universal_data/universaldata.dart';

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
  Future<UniversalData> sendPollRequest(
      {required int id,
      required DateTime createdAt,
      required DateTime updatedAt,
      required String name,
      required int topic,
      required int author,
      required bool archived}) async {
    Response response;
    try {
      response = await _dio.put("http://94.131.10.253:3000/poll/create", data: {
        "id": id,
        "createdAt": "2024-04-24T20:31:06.599Z",
        "updatedAt": "2024-04-24T20:31:06.599Z",
        "name": "Is it good in China?",
        "authorId": 24,
        "topicId": 3,
        "archived": false,
      });
      LoggerService.i("Response=>$response");
      LoggerService.e("Response=>${response.data}");
      return UniversalData(data: CreatePollModel.fromJson(response.data));
    } on DioException catch (e) {
      return UniversalData(error: e.response!.data["message"]);
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
