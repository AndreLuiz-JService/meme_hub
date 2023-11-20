import 'package:logger/logger.dart';
import 'package:meme_hub/app/core/api/api_cliente.dart';
import 'package:meme_hub/app/core/store/auth_settings.dart';
import 'package:meme_hub/app/services/auth/auth_service_interface.dart';

class AuthServiceImpl implements AuthServiceInterface {
  final logger = Logger();
  final ApiClient _apiClient;
  final AuthSettings _authSettings;

  AuthServiceImpl(this._apiClient, this._authSettings);

  @override
  Future<void> login(String email, String password) async {
    try {
      final response = await _apiClient.post('/login', {
        'Email': email,
        'Password': password,
      });
      final body = response.data as dynamic;
      final token = body['token'] as String;
      await _authSettings.setUserToken(token);
    } on Exception catch (e, s) {
      logger.e(e, stackTrace: s);
      throw Exception('Login ou senha inválidos');
    }
  }

  @override
  Future<void> register(
      String email, String password, String birthday, String name) async {
    try {
      await _apiClient.post('/user', {
        'Email': email,
        'Password': password,
        'Birthday': birthday,
        'Username': name,
      });
    } on Exception catch (e, s) {
      logger.e(e, stackTrace: s);
      rethrow;
    }
  }
}
