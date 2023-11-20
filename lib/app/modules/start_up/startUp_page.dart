import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:meme_hub/app/core/global/enum/enums.dart';
import 'package:meme_hub/app/core/ui/styles/colors_app.dart';
import 'package:meme_hub/app/modules/start_up/startUp_store.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

class StartUpPage extends StatefulWidget {
  final String title;
  const StartUpPage({Key? key, this.title = 'StartUpPage'}) : super(key: key);
  @override
  StartUpPageState createState() => StartUpPageState();
}

class StartUpPageState extends State<StartUpPage> {
  final StartUpStore store = Modular.get();

  late final ReactionDisposer statusReactionDisposer;

  @override
  void initState() {
    statusReactionDisposer = reaction(
      (_) => store.homeStatus,
      (status) {
        switch (status) {
          case PageStateStatus.loading:
            break;
          case PageStateStatus.success:
            Modular.to.pushReplacementNamed('/main/home/');
            break;
          case PageStateStatus.failure:
            Modular.to.pushReplacementNamed('/login');
            break;
          default:
            break;
        }
      },
    );
    Future.delayed(const Duration(seconds: 1), () {
      store.verifyUserToken();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: GestureDetector(
              onTap: () {
                store.verifyUserToken();
              },
              child: SvgPicture.asset(
                'assets/svg/logo.svg',
              ),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          SizedBox(
            height: 60,
            child: LoadingAnimationWidget.discreteCircle(
              color: primary,
              size: 60,
            ),
          )
        ],
      ),
    );
  }
}
