// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addingPost_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddingPostStore on _AddingPostStoreBase, Store {
  Computed<bool>? _$loginInLoadingComputed;

  @override
  bool get loginInLoading =>
      (_$loginInLoadingComputed ??= Computed<bool>(() => super.loginInLoading,
              name: '_AddingPostStoreBase.loginInLoading'))
          .value;

  late final _$_addingPostStatusAtom =
      Atom(name: '_AddingPostStoreBase._addingPostStatus', context: context);

  PageStateStatus get addingPostStatus {
    _$_addingPostStatusAtom.reportRead();
    return super._addingPostStatus;
  }

  @override
  PageStateStatus get _addingPostStatus => addingPostStatus;

  @override
  set _addingPostStatus(PageStateStatus value) {
    _$_addingPostStatusAtom.reportWrite(value, super._addingPostStatus, () {
      super._addingPostStatus = value;
    });
  }

  late final _$_errorMessageAtom =
      Atom(name: '_AddingPostStoreBase._errorMessage', context: context);

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

  @override
  String toString() {
    return '''
loginInLoading: ${loginInLoading}
    ''';
  }
}
