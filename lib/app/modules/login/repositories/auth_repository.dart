import 'package:logger/logger.dart';
import 'package:meme_hub/app/services/auth/auth_service_interface.dart';
import 'package:meme_hub/app/services/user/user_service_interface.dart';

class AuthRepository {
  final logger = Logger();
  final AuthServiceInterface authService;
  final UserServiceInterface userService;

  AuthRepository(this.authService, this.userService);

  Future<void> login(
    String email,
    String password,
  ) async {
    await authService.login(email, password);
    await userService.fetchCurrentUser();
  }

  Future<void> register(
    String email,
    String password,
    String birthday,
    String username,
  ) async {
    await authService.register(email, password, birthday, username);
  }
}
