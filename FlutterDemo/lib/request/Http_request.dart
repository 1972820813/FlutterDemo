import 'package:dio/dio.dart';
import 'package:flutterdemo/request/HttpConfig.dart';

class Http_request {
  static final BaseOptions baseOptions = BaseOptions(
      baseUrl: HttpConfig.baseUrl,
      connectTimeout: const Duration(seconds: HttpConfig.timeOut));

  static final Dio dio = Dio(baseOptions);

  static Future<T> request<T>(String url,
      {String method = "get", required Map<String, dynamic> params}) async {
    // 1 请求的单独配置
    final Options options = Options(method: method);

    // 2 添加第一个拦截器
    // ignore: unused_local_variable
    Interceptor dInter = InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
      print("请求之前 ${StackTrace.current}");
      handler.next(options);
    }, onResponse: (Response response, ResponseInterceptorHandler handler) {
      print("相应之前 ${StackTrace.current}");
      handler.next(response);
    }, onError: (DioError error, ErrorInterceptorHandler handler) {
      print("错误之前 ${StackTrace.current}");
      handler.next(error);
    });

    try {
      Response response =
          await dio.request<T>(url, queryParameters: params, options: options);
      return response.data;
    } on DioError catch (e) {
      return Future.error(e);
    }
  }
}
