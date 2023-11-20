import 'package:meme_hub/app/models/post/post_model.dart';
import 'package:meme_hub/app/services/posts/post_service_interface.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final PostServiceInterface postService;

  HomeStoreBase(this.postService);

  initClass() async {
    await fetchPosts();
  }

  @observable
  List<PostModel> posts = [];

  @action
  Future<void> fetchPosts() async {
    posts = await postService.fetchPosts();
  }
}
