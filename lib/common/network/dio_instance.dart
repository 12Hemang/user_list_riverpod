import 'package:dio/dio.dart';

final Dio dioInstance = Dio(
  BaseOptions(
    baseUrl: "https://jsonplaceholder.typicode.com"
  )
);

