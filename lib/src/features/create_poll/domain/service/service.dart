import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
// ignore: depend_on_referenced_packages
import 'package:http_parser/http_parser.dart';
import 'package:poll_dao/src/core/constants/server_constants.dart';
import 'package:poll_dao/src/features/create_poll/data/models/create_poll_model.dart';
import 'package:poll_dao/src/features/create_poll/data/models/option_model.dart';
import 'package:poll_dao/src/features/widget_servers/repositories/storage_repository.dart';

import '../../../widget_servers/universal_data/universaldata.dart';

class CreatePollApiService {
  Dio get _dio => Dio(
        BaseOptions(
          headers: {"Content-Type": "application/json"},
          connectTimeout: Duration(seconds: TimeOutConstants.connectTimeout),
          receiveTimeout: Duration(seconds: TimeOutConstants.receiveTimeout),
          sendTimeout: Duration(seconds: TimeOutConstants.sendTimeout),
        ),
      )..interceptors.add(
          InterceptorsWrapper(
            onError: (error, handler) async {
              log("ERRORGA TUSHDI:${error.message} and ${error.response}");
              return handler.next(error);
            },
            onRequest: (requestOptions, handler) async {
              log("SO'ROV YUBORILDI :${requestOptions.path} and ${requestOptions.headers} and ${requestOptions.data}");
              requestOptions.headers.addAll({"Access-Token": StorageRepository.getString("token")});
              return handler.next(requestOptions);
            },
            onResponse: (response, handler) async {
              log("JAVOB KELDI :${response.requestOptions.path}");
              return handler.next(response);
            },
          ),
        );

  const CreatePollApiService();

  Future<UniversalData> sendPollRequest({
    required String name,
    required int topic,
    required List<OptionModel> options,
    String? location,
    String? education,
    String? nationality,
    bool? biometryPassed,
    int? minAge,
    int? maxAge,
    String? gender,
    String? maternalLang,
  }) async {
    try {
      final data = FormData.fromMap({
        "name": name,
        "topic": topic,
        "restrictions.location": location,
        "restrictions.biometryPassed": biometryPassed,
        if (minAge != null && maxAge != null) "restrictions.age": "$minAge, $maxAge",
        "restrictions.education": education,
        "restrictions.nationality": nationality,
        "restrictions.gender": gender,
        "restrictions.maternalLang": maternalLang,
        for (int i = 0; i < options.length; i++)
          if (options[i].text != null) "options[$i].text": options[i].text,
        for (int i = 0; i < options.length; i++)
          if (options[i].image != null)
            "options[$i].image": await MultipartFile.fromFile(
              options[i].image!,
              contentType: MediaType("image", fileExtension(options[i].image)),
            ),
      });
      log("Options=>${options.map((e) => basename(e.image)).toList()}");

      final response = await _dio.post("http://94.131.10.253:3000/poll/create", data: data);
      log("Response=>$response");
      log("Response=>${response.data}");
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

String basename(String? path) {
  final List<String> parts = path?.split(RegExp(r'[\\/]')) ?? <String>[];
  return parts.isEmpty ? '' : parts.last;
}

String fileExtension(String? path) {
  final List<String> parts = path?.split('.') ?? <String>[];
  return parts.isEmpty ? '' : parts.last;
}
