import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

import 'generic_http_response.dart';

class HttpClient {
  static Dio dio = Dio();
  final GetStorage _box = GetStorage();

  static String baseUrl = 'https://reqres.in/api';


  static String apiUrl(String path, Map<String, dynamic>? queryParams) {
    String uriString = '$baseUrl/$path';
    return Uri.parse(uriString)
        .replace(queryParameters: queryParams)
        .toString();
  }

  static HttpClient? _instance;

  HttpClient._internal() {
    _init();
    _instance = this;
  }
  factory HttpClient() => _instance ?? HttpClient._internal();

  void _init() {
    dio.interceptors.add(
      InterceptorsWrapper(onRequest:
          (RequestOptions options, RequestInterceptorHandler handler) {
        final token = _box.read('token');

        if (!options.uri.path.contains('/login') &&
            !options.uri.path.contains('/register') &&
            !options.uri.path.contains('/password')) {
          options.headers = {
            "Accept": "application/json",
            "content-type": "application/json",
            'Authorization': 'Bearer $token',
          };
        }

        return handler.next(options);
      }, onResponse:
          (Response response, ResponseInterceptorHandler handler) async {
        return handler.next(response);
      }, onError: (DioError e, ErrorInterceptorHandler handler) async {
        return handler.next(e);
      }),
    );
  }

  Future<GenericHttpResponse> _executeHttpRequest(
    HttpRequestType httpRequestType,
    String path,
    Map<String, dynamic>? queryParams, {
    dynamic body,
  }) async {
    Response dioResponse;
    GenericHttpResponse response = GenericHttpResponse();

    try {
      switch (httpRequestType) {
        case HttpRequestType.GET:
          dioResponse = await dio.get(
            apiUrl(path, queryParams),
          );
          break;
        case HttpRequestType.POST:
          dioResponse = await dio.post(
            apiUrl(path, queryParams),
            data: body,
          );
          break;
        case HttpRequestType.PUT:
          dioResponse = await dio.put(
            apiUrl(path, queryParams),
            data: body,
          );
          break;
        case HttpRequestType.DELETE:
          dioResponse = await dio.delete(apiUrl(path, queryParams));
          break;
        default:
          dioResponse = await dio.get(
            apiUrl(path, queryParams),
          );
          break;
      }
      //If request wa successful
      response.success = true;
      response.body = dioResponse.data;
      response.status = dioResponse.statusCode;

      return response;
    } catch (e) {
      final dioError = e as DioError;
      if (dioError.response?.data is Map) {
        var responseMap = dioError.response?.data as Map;
        if (responseMap.containsKey('msg')) {
          response.message = dioError.response?.data['msg'];
        } else {
          response.body = dioError.response?.data;
        }
      } else if (dioError.response?.data is String) {
        response.message = dioError.response?.data;
      } else {
        response.message = dioError.message;
      }

      response.status = dioError.response?.statusCode;
      response.error = dioError.error;

      return response;
    }
  }

  Future<GenericHttpResponse> getRequest(String path,
      {Map<String, dynamic>? queryParams}) async {
    return await _executeHttpRequest(HttpRequestType.GET, path, queryParams);
  }

  Future<GenericHttpResponse> postRequest(String path,
      {Map<String, dynamic>? queryParams, dynamic body}) async {
    return await _executeHttpRequest(HttpRequestType.POST, path, queryParams,
        body: body);
  }

  Future<GenericHttpResponse> putRequest(String path,
      {Map<String, dynamic>? queryParams, dynamic body}) async {
    return await _executeHttpRequest(HttpRequestType.PUT, path, queryParams,
        body: body);
  }

  Future<GenericHttpResponse> deleteRequest(String path,
      {Map<String, dynamic>? queryParams}) async {
    return await _executeHttpRequest(HttpRequestType.DELETE, path, queryParams);
  }
}

enum HttpRequestType {
  GET,
  POST,
  PUT,
  DELETE,
}
