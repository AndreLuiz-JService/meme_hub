import 'package:dio/dio.dart';
import 'package:meme_hub/app/core/store/auth_settings.dart';

class ApiClient {
  final AuthSettings _authSettings;
  static final ApiClient _instance = ApiClient._internal(AuthSettings());
  late Dio dio;

  factory ApiClient() {
    return _instance;
  }

  ApiClient._internal(this._authSettings) {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://10.0.2.2:5123/api/',
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        sendTimeout: const Duration(seconds: 15),
      ),
    );
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (
          RequestOptions options,
          RequestInterceptorHandler handler,
        ) async {
          final token = await _authSettings.getUserToken();
          options.headers['Authorization'] = 'Bearer $token';
          return handler.next(options);
        },
      ),
    );
  }

  Future<Response> get(
      String endpoint, Map<String, dynamic> queryParameters) async {
    try {
      return await dio.get(
        endpoint,
        queryParameters: queryParameters,
      );
    } catch (e) {
      // Trate os erros conforme necessário
      rethrow;
    }
  }

  Future<Response> post(String endpoint, Map<String, dynamic> body) async {
    try {
      return await dio.post(
        endpoint,
        data: body,
      );
    } catch (e) {
      // Trate os erros conforme você define
      rethrow;
    }
  }
}
