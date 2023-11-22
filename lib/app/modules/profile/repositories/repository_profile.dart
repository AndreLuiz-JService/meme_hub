import 'package:meme_hub/app/models/auth/user_model.dart';
import 'package:meme_hub/app/models/post/post_model.dart';
import 'package:meme_hub/app/services/auth/auth_service_interface.dart';
import 'package:meme_hub/app/services/posts/post_service_interface.dart';
import 'package:meme_hub/app/services/user/user_service_interface.dart';

class RepositoryProfile {
  final UserServiceInterface userService;
  final PostServiceInterface postService;
  final AuthServiceInterface authService;

  RepositoryProfile(this.userService, this.postService, this.authService);

  Future<UserModel> fetchUserById(String? id) async {
    final user = await userService.getById(id);
    return user;
  }

  Future<List<PostModel>> fetchUserPosts(String? id) async {
    final posts = await postService.fetchPostsByUser(id ?? userService.user.id);
    return posts;
  }

  Future<void> logout() async {
    await authService.logout();
  }
}
