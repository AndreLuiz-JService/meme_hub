import 'package:meme_hub/app/core/store/auth_settings.dart';
import 'package:meme_hub/app/modules/start_up/repositories/start_up_repository.dart';
import 'package:meme_hub/app/modules/start_up/startUp_page.dart';
import 'package:meme_hub/app/modules/start_up/startUp_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class StartUpModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton(
      (i) => StartUpRepository(
        i<AuthSettings>(),
      ),
    ),
    Bind.lazySingleton(
      (i) => StartUpStore(
        i<StartUpRepository>(),
      ),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => const StartUpPage(),
    ),
  ];
}
