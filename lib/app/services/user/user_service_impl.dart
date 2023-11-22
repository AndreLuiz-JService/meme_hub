import 'package:logger/logger.dart';
import 'package:meme_hub/app/core/api/api_cliente.dart';
import 'package:meme_hub/app/models/auth/user_model.dart';
import 'package:meme_hub/app/services/user/user_service_interface.dart';

class UserServiceImpl implements UserServiceInterface {
  final logger = Logger();
  final ApiClient _apiClient;
  UserServiceImpl(this._apiClient);

  late UserModel _currentUser;

  UserModel get currentUser => _currentUser;

  @override
  Future<void> fetchCurrentUser() async {
    final response = await _apiClient.get('/user/current', {});
    final body = response.data as dynamic;
    _currentUser = UserModel.fromMap(body);
  }

  @override
  Future<UserModel> getById(String? id) async {
    final userId = id ?? currentUser.id;
    final response = await _apiClient.get('/user/$userId', {});
    final body = response.data as dynamic;
    final user = UserModel.fromMap(body);
    return user;
  }

  @override
  UserModel get user => _currentUser;

  @override
  Future<void> updateUser(Map<String, dynamic> data) async {
    try {
      final response = await _apiClient.put('/user/${_currentUser.id}', data);
      final body = response.data as dynamic;
      _currentUser = UserModel.fromMap(body);
    } on Exception catch (e, s) {
      logger.e(e, stackTrace: s);
      rethrow;
    }
  }
}
