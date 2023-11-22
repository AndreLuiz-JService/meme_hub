import 'package:meme_hub/app/models/auth/user_model.dart';

abstract class UserServiceInterface {
  Future<void> fetchCurrentUser();
  Future<UserModel> getById(String? id);
  UserModel get user;
  Future<void> updateUser(Map<String, dynamic> data);
}
