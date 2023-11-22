import 'package:meme_hub/app/services/user/user_service_interface.dart';

class UpdateRepository {
  final UserServiceInterface userService;

  UpdateRepository(this.userService);

  Future<void> updateUser(Map<String, dynamic> data) async {
    await userService.updateUser(data);
  }
}
