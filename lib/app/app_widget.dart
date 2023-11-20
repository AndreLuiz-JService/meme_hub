import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:meme_hub/app/core/ui/styles/colors_app.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Meme Hub',
      theme: ThemeData(
        scaffoldBackgroundColor: colorWhite,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: primary,
          secondary: grey,
        ),
        fontFamily: 'OpenSans'
      ),
      routerDelegate: Modular.routerDelegate,
      routeInformationParser: Modular.routeInformationParser,
    );
  }
}
