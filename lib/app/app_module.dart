import 'package:flutter_modular/flutter_modular.dart';
import 'package:meme_hub/app/core/api/api_cliente.dart';
import 'package:meme_hub/app/core/store/auth_settings.dart';
import 'package:meme_hub/app/modules/adding_post/addingPost_module.dart';
import 'package:meme_hub/app/modules/core/core_module.dart';
import 'package:meme_hub/app/modules/login/login_module.dart';
import 'package:meme_hub/app/modules/profile/profile_detail/profileDetail_module.dart';
import 'package:meme_hub/app/modules/profile/profile_module.dart';
import 'package:meme_hub/app/modules/start_up/startUp_module.dart';
import 'package:meme_hub/app/modules/template/base_layout.dart';
import 'package:meme_hub/app/services/auth/auth_service_impl.dart';
import 'package:meme_hub/app/services/auth/auth_service_interface.dart';
import 'package:meme_hub/app/services/firebase/fire_base_storage_service.dart';
import 'package:meme_hub/app/services/posts/post_service_impl.dart';
import 'package:meme_hub/app/services/posts/post_service_interface.dart';
import 'package:meme_hub/app/services/user/user_service_impl.dart';
import 'package:meme_hub/app/services/user/user_service_interface.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];

  @override
  final List<Bind> binds = [
    Bind.lazySingleton<FirebaseStorageService>(
      (i) => FirebaseStorageService(),
    ),
    Bind.lazySingleton<UserServiceInterface>(
      (i) => UserServiceImpl(
        i<ApiClient>(),
      ),
    ),
    Bind.lazySingleton<AuthServiceInterface>(
      (i) => AuthServiceImpl(
        i<ApiClient>(),
        i<AuthSettings>(),
      ),
    ),
    Bind.lazySingleton<PostServiceInterface>(
      (i) => PostServiceImpl(
        i<ApiClient>(),
      ),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: StartUpModule()),
    ModuleRoute('/login', module: LoginModule()),
    ChildRoute(
      '/main',
      child: (_, args) => const BaseLayout(
        body: RouterOutlet(),
      ),
      children: [
        ModuleRoute('/home', module: HomeModule()),
        ModuleRoute(
          '/profile',
          module: ProfileModule(),
        ),
      ],
    ),
    ModuleRoute('/profileDetail', module: ProfileDetailModule(),),
    ModuleRoute(
      '/adding_post',
      module: AddingPostModule(),
    ),
  ];
}
