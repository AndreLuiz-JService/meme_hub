import 'package:meme_hub/app/modules/profile/profile_detail/profileDetail_page.dart';
import 'package:meme_hub/app/modules/profile/profile_detail/profileDetail_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:meme_hub/app/modules/profile/profile_detail/repositories/update_repository.dart';
import 'package:meme_hub/app/services/user/user_service_interface.dart';

class ProfileDetailModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => UpdateRepository(
          i<UserServiceInterface>(),
        )),
    Bind.lazySingleton((i) => ProfileDetailStore(
          i<UpdateRepository>(),
        )),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const ProfileDetailPage()),
  ];
}
