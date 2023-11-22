// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfileStore on _ProfileStoreBase, Store {
  Computed<bool>? _$loginInLoadingComputed;

  @override
  bool get loginInLoading =>
      (_$loginInLoadingComputed ??= Computed<bool>(() => super.loginInLoading,
              name: '_ProfileStoreBase.loginInLoading'))
          .value;

  late final _$_profileStatusAtom =
      Atom(name: '_ProfileStoreBase._profileStatus', context: context);

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
      Atom(name: '_ProfileStoreBase.pageState', context: context);

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
      Atom(name: '_ProfileStoreBase._errorMessage', context: context);

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

  late final _$userAtom =
      Atom(name: '_ProfileStoreBase.user', context: context);

  @override
  UserModel? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserModel? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$postsAtom =
      Atom(name: '_ProfileStoreBase.posts', context: context);

  @override
  List<PostModel> get posts {
    _$postsAtom.reportRead();
    return super.posts;
  }

  @override
  set posts(List<PostModel> value) {
    _$postsAtom.reportWrite(value, super.posts, () {
      super.posts = value;
    });
  }

  late final _$initClassAsyncAction =
      AsyncAction('_ProfileStoreBase.initClass', context: context);

  @override
  Future initClass(String? userId) {
    return _$initClassAsyncAction.run(() => super.initClass(userId));
  }

  late final _$fetchUserByIdAsyncAction =
      AsyncAction('_ProfileStoreBase.fetchUserById', context: context);

  @override
  Future<void> fetchUserById(String? id) {
    return _$fetchUserByIdAsyncAction.run(() => super.fetchUserById(id));
  }

  late final _$fetchUserPostsAsyncAction =
      AsyncAction('_ProfileStoreBase.fetchUserPosts', context: context);

  @override
  Future<void> fetchUserPosts(String? id) {
    return _$fetchUserPostsAsyncAction.run(() => super.fetchUserPosts(id));
  }

  late final _$logoutAsyncAction =
      AsyncAction('_ProfileStoreBase.logout', context: context);

  @override
  Future<void> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  late final _$_ProfileStoreBaseActionController =
      ActionController(name: '_ProfileStoreBase', context: context);

  @override
  dynamic changePageState(PageState state) {
    final _$actionInfo = _$_ProfileStoreBaseActionController.startAction(
        name: '_ProfileStoreBase.changePageState');
    try {
      return super.changePageState(state);
    } finally {
      _$_ProfileStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pageState: ${pageState},
user: ${user},
posts: ${posts},
loginInLoading: ${loginInLoading}
    ''';
  }
}
