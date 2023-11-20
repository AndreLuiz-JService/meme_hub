import 'package:meme_hub/app/models/post/post_model.dart';

abstract class PostServiceInterface {
  Future<List<PostModel>> fetchPosts();
  Future<void> createPost(String title, String image);
}
