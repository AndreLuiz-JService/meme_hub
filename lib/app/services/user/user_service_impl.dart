import 'package:meme_hub/app/core/api/api_cliente.dart';
import 'package:meme_hub/app/models/auth/user_model.dart';
import 'package:meme_hub/app/services/user/user_service_interface.dart';

class UserServiceImpl implements UserServiceInterface {
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
}
