import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_zero_to_one/wtf_bus.dart';

class HttpBase {
  factory HttpBase() => _getInstance();
  static HttpBase _instance;
  Dio _dio;

  HttpBase._() {
    _dio = Dio();
    _dio.options.connectTimeout = 20000; //20s


    _dio.interceptors.add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      if (kDebugMode) print('>>>>>>>>>>>>>请求数据>>>>>>>>>>>>> ${options.method} ${options.uri} ${options.data}');
      options.headers.addAll(_headers);
      return options;
    }, onResponse: (Response response) {
      if (kDebugMode) print('<<<<<<<<<<<<<返回数据<<<<<<<<<<<<< ${response.request.uri} $response');
    }, onError: (DioError e) {
      if (kDebugMode) print('-------------错误-------------  ${e.request.uri} ${e.message}');
    }));

//    _dio.interceptors.add(LogInterceptor(requestBody:true, responseBody: true));
  }

  static HttpBase _getInstance() {
    if (_instance == null) {
      _instance = HttpBase._();
    }
    return _instance;
  }

  static Map<String, dynamic> _headers = Map();

  Map<String, String> get headers => _headers;

  addHeaders(Map<String, dynamic> header) => _headers.addAll(header);

  Response _process(Response response) {
    return response;
  }

  Future<Response> get(String url, String path, {Map<String, dynamic> params, Options options}) {
    return _get(url, path, params: params, options: options);
  }

  Future<Response> _get(String url, String path, {Map<String, dynamic> params, Options options}) async {
    try {
      Response response = await _dio.get(url + path, queryParameters: params, options: options);
      return _process(response);
    } on DioError catch (e) {
      WtfBus().postEvent(e);
      return Future.value(null);
    }
  }

  Future<Response> post(String url, String path, {dynamic data, Options options, bool showLoading = true}) {
    return _post(url, path, data: data, options: options);
  }

  Future<Response> _post(String url, String path, {dynamic data, Options options, bool showLoading = true}) async {
    try {
      var response = await _dio.post(url + path, data: data, options: options);
      return _process(response);
    } on DioError catch (e) {
      WtfBus().postEvent(e);
      return Future.value(null);
    }
  }
}
