import 'package:meme_hub/app/modules/profile/profile_page.dart';
import 'package:meme_hub/app/modules/profile/profile_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:meme_hub/app/modules/profile/repositories/repository_profile.dart';
import 'package:meme_hub/app/services/auth/auth_service_interface.dart';
import 'package:meme_hub/app/services/posts/post_service_interface.dart';
import 'package:meme_hub/app/services/user/user_service_interface.dart';

class ProfileParams {
  final String userId;
  const ProfileParams({
    required this.userId,
  });
}

class ProfileModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<RepositoryProfile>(
      (i) => RepositoryProfile(
        i<UserServiceInterface>(),
        i<PostServiceInterface>(),
        i<AuthServiceInterface>(),
      ),
    ),
    Bind.lazySingleton(
      (i) => ProfileStore(
        i<RepositoryProfile>(),
      ),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => ProfilePage(
        params: args.data as ProfileParams?,
      ),
    ),
  ];
}
