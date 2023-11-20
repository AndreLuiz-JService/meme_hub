import 'package:meme_hub/app/modules/login/login_page.dart';
import 'package:meme_hub/app/modules/login/login_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:meme_hub/app/modules/login/repositories/auth_repository.dart';
import 'package:meme_hub/app/services/auth/auth_service_interface.dart';
import 'package:meme_hub/app/services/user/user_service_interface.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton(
      (i) => AuthRepository(
        i<AuthServiceInterface>(),
        i<UserServiceInterface>(),
      ),
    ),
    Bind.lazySingleton(
      (i) => LoginStore(
        i<AuthRepository>(),
      ),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const LoginPage()),
  ];
}
