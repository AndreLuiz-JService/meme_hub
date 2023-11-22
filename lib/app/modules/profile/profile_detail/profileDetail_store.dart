import 'package:meme_hub/app/core/global/enum/enums.dart';
import 'package:meme_hub/app/models/auth/user_model.dart';
import 'package:meme_hub/app/modules/profile/profile_detail/repositories/update_repository.dart';
import 'package:meme_hub/app/modules/profile/profile_store.dart';
import 'package:mobx/mobx.dart';

part 'profileDetail_store.g.dart';

class ProfileDetailStore = _ProfileDetailStoreBase with _$ProfileDetailStore;

abstract class _ProfileDetailStoreBase with Store {

  final UpdateRepository updateRepository;
  _ProfileDetailStoreBase(this.updateRepository);

  @readonly
  var _profileStatus = PageStateStatus.initial;

  @computed
  bool get profileDetailInLoading => _profileStatus == PageStateStatus.loading;

  @observable
  PageState pageState = PageState.Post;

  @action
  changePageState(PageState state) {
    pageState = state;
  }

  @readonly
  String? _errorMessage;

  UserModel get user => updateRepository.user;

  Future<void> updateUser(
      {String? newPassWord,
      String? username,
      String? birthday,
      String? email}) async {
    _profileStatus = PageStateStatus.loading;
    try {
      final data = {
        if (newPassWord != null && newPassWord.isNotEmpty)
          'password': newPassWord,
        if (username != null && username.isNotEmpty) 'username': username,
        if (birthday != null && birthday.isNotEmpty) 'birthday': birthday,
        if (email != null && email.isNotEmpty) 'email': email
      };
      await updateRepository.updateUser(data);
      _profileStatus = PageStateStatus.success;
    } catch (e) {
      _errorMessage = e.toString();
      _profileStatus = PageStateStatus.failure;
    }
  }
}
