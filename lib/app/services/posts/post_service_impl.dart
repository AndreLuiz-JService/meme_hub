import 'package:meme_hub/app/core/api/api_cliente.dart';
import 'package:meme_hub/app/models/post/post_model.dart';
import 'package:meme_hub/app/services/posts/post_service_interface.dart';

class PostServiceImpl implements PostServiceInterface {
  final ApiClient _apiClient;

  PostServiceImpl(this._apiClient);

  @override
  Future<List<PostModel>> fetchPosts() async {
    final response = await _apiClient.get('/post', {});
    final body = response.data as List<dynamic>;
    return body.map((postData) => PostModel.fromMap(postData)).toList();
  }

  @override
  Future<void> createPost(String title, String image) async {
    await _apiClient.post(
      '/post',
      {
        'title': title,
        'imageUrl': image,
      },
    );
  }
}
