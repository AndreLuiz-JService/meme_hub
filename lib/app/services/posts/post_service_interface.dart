import 'package:meme_hub/app/models/post/post_model.dart';

abstract class PostServiceInterface {
  Future<List<PostModel>> fetchPosts();
  Future<List<PostModel>> fetchPostsByUser(String userId);
  Future<void> createPost(String title, String image);
  Future<void> updatePostRating(String postId, bool value);
}
