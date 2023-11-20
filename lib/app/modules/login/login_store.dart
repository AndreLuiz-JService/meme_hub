// ignore_for_file: library_private_types_in_public_api
import 'package:logger/logger.dart';
import 'package:meme_hub/app/core/global/enum/enums.dart';
import 'package:meme_hub/app/modules/login/repositories/auth_repository.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  final logger = Logger();

  final AuthRepository authService;
  _LoginStoreBase(this.authService);

  @readonly
  var _homeStatus = PageStateStatus.initial;
  @computed
  bool get loginInLoading => _homeStatus == PageStateStatus.loading;

  @readonly
  String? _errorMessage;

  @action
  Future<void> login(
    String email,
    String password,
  ) async {
    _homeStatus = PageStateStatus.loading;
    try {
      await authService.login(email, password);
      _homeStatus = PageStateStatus.success;
    } on Exception catch (e) {
      logger.e(e);
      _errorMessage = e.toString();
      _homeStatus = PageStateStatus.failure;
    }
  }

  @action
  Future<void> register(
    String email,
    String password,
    String birthday,
    String username,
  ) async {
    _homeStatus = PageStateStatus.loading;
    try {
      await authService.register(email, password, birthday, username);
      await authService.login(email, password);
      _homeStatus = PageStateStatus.success;
    } on Exception catch (e) {
      logger.e(e);
      _errorMessage = e.toString();
      _homeStatus = PageStateStatus.failure;
    }
  }
}
