import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:poll_dao/src/core/constants/server_constants.dart';
import 'package:poll_dao/src/features/custom_sliver_example/data/models/topic_model.dart';
import 'package:poll_dao/src/features/topics/domain/topic_repository.dart';

class TopicRepositoryImpl implements TopicRepository {
  const TopicRepositoryImpl();

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
              debugPrint("ERRORGA TUSHDI:${error.message} and ${error.response}");
              return handler.next(error);
            },
            onRequest: (requestOptions, handler) async {
              debugPrint("SO'ROV YUBORILDI :${requestOptions.path}");
              // requestOptions.headers.addAll({"token": StorageRepository.getString("token")});
              return handler.next(requestOptions);
            },
            onResponse: (response, handler) async {
              debugPrint("JAVOB KELDI :${response.requestOptions.path}, ${response.data}");
              return handler.next(response);
            },
          ),
        );

  @override
  Future<List<TopicModel>> getTopics() async {
    final response = await _dio.get("http://94.131.10.253:3000/public/topics");
    if (response.data is List) {
      return (response.data as List).map(
        (e) {
          return TopicModel(
            id: (e as Map<String, dynamic>)["id"] as int,
            name: (e)["name"] as String,
          );
        },
      ).toList();
    }
    return [];
  }
}
