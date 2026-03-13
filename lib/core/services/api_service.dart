import 'package:dio/dio.dart';

class ApiService {
  final apiKey = 'AIzaSyCvkZKeuE4Hmd-uDd4M24cmo8p1sLSgwSI';
  final String _baseURL = 'https://www.googleapis.com/books/v1/';
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    final response = await _dio.get('$_baseURL$endPoint&key=$apiKey');

    return response.data;
  }
}
