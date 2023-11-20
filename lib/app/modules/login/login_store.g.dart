// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginStore on _LoginStoreBase, Store {
  Computed<bool>? _$loginInLoadingComputed;

  @override
  bool get loginInLoading =>
      (_$loginInLoadingComputed ??= Computed<bool>(() => super.loginInLoading,
              name: '_LoginStoreBase.loginInLoading'))
          .value;

  late final _$_homeStatusAtom =
      Atom(name: '_LoginStoreBase._homeStatus', context: context);

  PageStateStatus get homeStatus {
    _$_homeStatusAtom.reportRead();
    return super._homeStatus;
  }

  @override
  PageStateStatus get _homeStatus => homeStatus;

  @override
  set _homeStatus(PageStateStatus value) {
    _$_homeStatusAtom.reportWrite(value, super._homeStatus, () {
      super._homeStatus = value;
    });
  }

  late final _$_errorMessageAtom =
      Atom(name: '_LoginStoreBase._errorMessage', context: context);

  String? get errorMessage {
    _$_errorMessageAtom.reportRead();
    return super._errorMessage;
  }

  @override
  String? get _errorMessage => errorMessage;

  @override
  set _errorMessage(String? value) {
    _$_errorMessageAtom.reportWrite(value, super._errorMessage, () {
      super._errorMessage = value;
    });
  }

  late final _$loginAsyncAction =
      AsyncAction('_LoginStoreBase.login', context: context);

  @override
  Future<void> login(String email, String password) {
    return _$loginAsyncAction.run(() => super.login(email, password));
  }

  late final _$registerAsyncAction =
      AsyncAction('_LoginStoreBase.register', context: context);

  @override
  Future<void> register(
      String email, String password, String birthday, String username) {
    return _$registerAsyncAction
        .run(() => super.register(email, password, birthday, username));
  }

  @override
  String toString() {
    return '''
loginInLoading: ${loginInLoading}
    ''';
  }
}
