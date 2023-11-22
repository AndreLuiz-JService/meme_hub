import 'package:meme_hub/app/models/auth/user_model.dart';
import 'package:meme_hub/app/services/user/user_service_interface.dart';

class UpdateRepository {
  final UserServiceInterface userService;
  UpdateRepository(this.userService);

  UserModel get user => userService.user;

  Future<void> updateUser(Map<String, dynamic> data) async {
    await userService.updateUser(data);
  }
}
