// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'startUp_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StartUpStore on _StartUpStoreBase, Store {
  Computed<bool>? _$loginInLoadingComputed;

  @override
  bool get loginInLoading =>
      (_$loginInLoadingComputed ??= Computed<bool>(() => super.loginInLoading,
              name: '_StartUpStoreBase.loginInLoading'))
          .value;

  late final _$_homeStatusAtom =
      Atom(name: '_StartUpStoreBase._homeStatus', context: context);

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

  @override
  ObservableFuture<void> verifyUserToken() {
    final _$future = super.verifyUserToken();
    return ObservableFuture<void>(_$future, context: context);
  }

  @override
  String toString() {
    return '''
loginInLoading: ${loginInLoading}
    ''';
  }
}
