import 'package:dio/dio.dart';

class ApiHelper {
  static late Dio dio;

  static void init() {
    dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        headers: {'Content-Type': 'application/json'},
      ),
    );
  }
}
