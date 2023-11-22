// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profileDetail_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfileDetailStore on _ProfileDetailStoreBase, Store {
  Computed<bool>? _$profileDetailInLoadingComputed;

  @override
  bool get profileDetailInLoading => (_$profileDetailInLoadingComputed ??=
          Computed<bool>(() => super.profileDetailInLoading,
              name: '_ProfileDetailStoreBase.profileDetailInLoading'))
      .value;

  late final _$_profileStatusAtom =
      Atom(name: '_ProfileDetailStoreBase._profileStatus', context: context);

  PageStateStatus get profileStatus {
    _$_profileStatusAtom.reportRead();
    return super._profileStatus;
  }

  @override
  PageStateStatus get _profileStatus => profileStatus;

  @override
  set _profileStatus(PageStateStatus value) {
    _$_profileStatusAtom.reportWrite(value, super._profileStatus, () {
      super._profileStatus = value;
    });
  }

  late final _$pageStateAtom =
      Atom(name: '_ProfileDetailStoreBase.pageState', context: context);

  @override
  PageState get pageState {
    _$pageStateAtom.reportRead();
    return super.pageState;
  }

  @override
  set pageState(PageState value) {
    _$pageStateAtom.reportWrite(value, super.pageState, () {
      super.pageState = value;
    });
  }

  late final _$_errorMessageAtom =
      Atom(name: '_ProfileDetailStoreBase._errorMessage', context: context);

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

  late final _$_ProfileDetailStoreBaseActionController =
      ActionController(name: '_ProfileDetailStoreBase', context: context);

  @override
  dynamic changePageState(PageState state) {
    final _$actionInfo = _$_ProfileDetailStoreBaseActionController.startAction(
        name: '_ProfileDetailStoreBase.changePageState');
    try {
      return super.changePageState(state);
    } finally {
      _$_ProfileDetailStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pageState: ${pageState},
profileDetailInLoading: ${profileDetailInLoading}
    ''';
  }
}
