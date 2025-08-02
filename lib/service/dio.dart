import 'package:dio/dio.dart';

final dio = Dio();

void configureDio() {
  dio.options.baseUrl = 'https://api.github.com';
  dio.options.connectTimeout = const Duration(seconds: 3);
  dio.options.receiveTimeout = const Duration(seconds: 3);
}