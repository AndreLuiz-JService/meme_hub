// ignore_for_file: library_private_types_in_public_api, constant_identifier_names

import 'package:flutter_modular/flutter_modular.dart';
import 'package:meme_hub/app/core/global/enum/enums.dart';
import 'package:meme_hub/app/models/auth/user_model.dart';
import 'package:meme_hub/app/models/post/post_model.dart';
import 'package:meme_hub/app/modules/profile/repositories/repository_profile.dart';
import 'package:mobx/mobx.dart';
part 'profile_store.g.dart';

enum PageState { Post, Likes }

class ProfileStore = _ProfileStoreBase with _$ProfileStore;

abstract class _ProfileStoreBase with Store {
  final RepositoryProfile repositoryProfile;
  _ProfileStoreBase(this.repositoryProfile);

  @readonly
  var _profileStatus = PageStateStatus.initial;

  @computed
  bool get loginInLoading => _profileStatus == PageStateStatus.loading;

  @observable
  PageState pageState = PageState.Post;

  @action
  changePageState(PageState state) {
    pageState = state;
  }

  @readonly
  String? _errorMessage;

  @action
  initClass(String? userId) async {
    _profileStatus = PageStateStatus.loading;
    try {
      await fetchUserById(userId);
      await fetchUserPosts(userId);
      await fetchUserLikedPosts();
      _profileStatus = PageStateStatus.success;
    } catch (e) {
      _profileStatus = PageStateStatus.failure;
      _errorMessage = e.toString();
      rethrow;
    }
  }

  @observable
  UserModel? user;

  @action
  Future<void> fetchUserById(String? id) async {
    user = await repositoryProfile.fetchUserById(id);
  }

  @observable
  List<PostModel> posts = [];

  @action
  Future<void> fetchUserPosts(String? id) async {
    posts = await repositoryProfile.fetchUserPosts(id);
  }

  @observable
  List<PostModel> likedPosts = [];
  @action
  Future<void> fetchUserLikedPosts() async {
    likedPosts = await repositoryProfile.fetchUserLikedPosts();
  }

  @action
  Future<void> logout() async {
    await repositoryProfile.logout();
    Modular.to.navigate('/login');
  }
}
