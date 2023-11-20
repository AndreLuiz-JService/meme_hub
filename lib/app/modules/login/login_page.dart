import 'package:flutter_modular/flutter_modular.dart';
import 'package:meme_hub/app/core/global/enum/enums.dart';
import 'package:meme_hub/app/core/ui/mixin/messages.dart';
import 'package:meme_hub/app/modules/login/login_store.dart';
import 'package:flutter/material.dart';
import 'package:meme_hub/app/modules/login/views/login_view.dart';
import 'package:meme_hub/app/modules/login/views/register_view.dart';
import 'package:mobx/mobx.dart';

enum LoginType { login, register }

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key? key, this.title = 'LoginPage'}) : super(key: key);
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> with Messages {
  final LoginStore store = Modular.get();
  LoginType loginType = LoginType.login;

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
            Modular.to.navigate('/main/home');
            break;
          case PageStateStatus.failure:
            showError(
              store.errorMessage!,
            );
            break;
          default:
            break;
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    switch (loginType) {
      case LoginType.login:
        return LoginViewPage(
          onChangeViewType: () => setState(
            () => loginType = LoginType.register,
          ),
          onLogin: store.login,
          pageInLoading: store.loginInLoading,
        );
      case LoginType.register:
        return RegisterViewPage(
          onChangeViewType: () {
            setState(
              () => loginType = LoginType.login,
            );
          },
          onLogin: store.register,
          pageInLoading: store.loginInLoading,
        );
    }
  }
}
