import 'package:meme_hub/app/modules/adding_post/addingPost_page.dart';
import 'package:meme_hub/app/modules/adding_post/addingPost_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:meme_hub/app/modules/adding_post/repositories/upload_post_repository.dart';
import 'package:meme_hub/app/services/firebase/fire_base_storage_service.dart';
import 'package:meme_hub/app/services/posts/post_service_interface.dart';

class AddingPostModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton(
      (i) => UploadPostRepository(
        i<FirebaseStorageService>(),
        i<PostServiceInterface>(),
      ),
    ),
    Bind.lazySingleton((i) => AddingPostStore(
      i<UploadPostRepository>(),
    )),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const AddingPostPage()),
  ];
}
