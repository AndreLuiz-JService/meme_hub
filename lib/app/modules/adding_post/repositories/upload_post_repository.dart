import 'package:image_picker/image_picker.dart';
import 'package:meme_hub/app/services/firebase/fire_base_storage_service.dart';
import 'package:meme_hub/app/services/posts/post_service_interface.dart';

class UploadPostRepository {
  final FirebaseStorageService firebaseStorageService;
  final PostServiceInterface postService;

  UploadPostRepository(
    this.firebaseStorageService,
    this.postService,
  );

  Future<void> uploadFile(String title, XFile xfile) async {
    final url = await firebaseStorageService.uploadFile(xfile);
    await postService.createPost(title, url);
  }
}
