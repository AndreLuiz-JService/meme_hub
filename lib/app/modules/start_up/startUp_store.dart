// ignore_for_file: library_private_types_in_public_api

import 'package:meme_hub/app/core/global/enum/enums.dart';
import 'package:meme_hub/app/modules/start_up/repositories/start_up_repository.dart';
import 'package:mobx/mobx.dart';

part 'startUp_store.g.dart';

class StartUpStore = _StartUpStoreBase with _$StartUpStore;

abstract class _StartUpStoreBase with Store {
  final StartUpRepository startUpRepository;
  _StartUpStoreBase(this.startUpRepository);

  @readonly
  var _homeStatus = PageStateStatus.loading;
  @computed
  bool get loginInLoading => _homeStatus == PageStateStatus.loading;

  @observable
  Future<void> verifyUserToken() async {
    final response = await startUpRepository.validateUserToken();
    if (response) {
      _homeStatus = PageStateStatus.success;
    } else {
      _homeStatus = PageStateStatus.failure;
    }
  }
}
