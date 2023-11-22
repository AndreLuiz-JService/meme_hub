import 'package:flutter_modular/flutter_modular.dart';
import 'package:meme_hub/app/modules/profile/profile_detail/profileDetail_store.dart';
import 'package:flutter/material.dart';

class ProfileDetailPage extends StatefulWidget {
  final String title;
  const ProfileDetailPage({Key? key, this.title = 'ProfileDetailPage'})
      : super(key: key);
  @override
  ProfileDetailPageState createState() => ProfileDetailPageState();
}

class ProfileDetailPageState extends State<ProfileDetailPage> {
  final ProfileDetailStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[],
    );
  }
}
