import 'package:flutter/material.dart';

class AssetsApp {
  static AssetsApp? _instance;
  // Avoid self isntance
  AssetsApp._();
  static AssetsApp get instance {
    _instance ??= AssetsApp._();
    return _instance!;
  }

  //Logo
  String get logo => 'assets/svg/logo.svg';

  //BottomNavigator
  String get home => 'assets/svg/home.svg';
  String get acount => 'assets/svg/acount_circle.svg';

  //others
  String get lock => 'assets/svg/lock.svg';
  String get filter => 'assets/svg/filter.svg';
  String get visibility => 'assets/svg/visibility.svg';
  String get email => 'assets/svg/email.svg';
  String get addPhoto => 'assets/svg/add_photo.svg';
  String get photoCamera => 'assets/svg/add_photo.svg';

  //NavBar
  String get bottomNavigatorIconHome => 'assets/svg/nav_bar/home.svg';
  String get bottomNavigatorIconAdd => 'assets/svg/nav_bar/add_circle.svg';
  String get bottomNavigatorIconAccount => 'assets/svg/nav_bar/account_circle.svg';
}

extension AssetsAppExtensions on BuildContext {
  AssetsApp get assets => AssetsApp.instance;
}
