import 'package:meme_hub/app/modules/profile/profile_detail/profileDetail_page.dart';
import 'package:meme_hub/app/modules/profile/profile_detail/profileDetail_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProfileDetailModule extends Module {
  @override
  final List<Bind> binds = [Bind.lazySingleton((i) => ProfileDetailStore()),];

  @override
  final List<ModularRoute> routes = [ChildRoute('/', child: (_, args) => ProfileDetailPage()),];

}