import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class DataSource {
  Future<Either<String, Map<String, dynamic>>> http_get(String url);
}

class DataSourceImpl implements DataSource{
  final Dio dio;

  DataSourceImpl({required this.dio});

  Future<Either<String, Map<String, dynamic>>> http_get(String url) async {
    try {
      final res = await dio.get(
          url,
          options: Options(receiveTimeout: 1000, sendTimeout: 1000));
      if (res.statusCode == 200) {
        try {
          return Right(jsonDecode(res.data));
        } catch (e) {
          return const Left("faild to decode json");
        }
      } else {
        return const Left("bad status code");
      }
    }
    on DioError catch (e) {
      return Left("connection error");
    }
  }
}