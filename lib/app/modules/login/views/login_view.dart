import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meme_hub/app/core/ui/atons/buttons/custom_button.dart';
import 'package:meme_hub/app/core/ui/atons/text_field/custom_text_field.dart';
import 'package:meme_hub/app/core/ui/atons/typography/custom_text.dart';
import 'package:meme_hub/app/core/ui/atons/typography/typography.dart';
import 'package:meme_hub/app/core/ui/extensions/size_extensions.dart';
import 'package:meme_hub/app/core/ui/styles/colors_app.dart';
import 'package:validatorless/validatorless.dart';

class LoginViewPage extends StatefulWidget {
  const LoginViewPage({
    super.key,
    required this.onChangeViewType,
    required this.onLogin,
    required this.pageInLoading,
  });

  final VoidCallback onChangeViewType;
  final Future<void> Function(String email, String password) onLogin;
  final bool pageInLoading;

  @override
  State<LoginViewPage> createState() => _LoginViewPageState();
}

class _LoginViewPageState extends State<LoginViewPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isObscure = true;
  setObscureText() {
    setState(() {
      isObscure = !isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: context.percentHeight(0.1),
                  ),
                  Center(
                    child: SizedBox(
                      width: context.percentWidth(0.5),
                      child: SvgPicture.asset(
                        'assets/svg/logo.svg',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 90,
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: CustomText(
                      textType: TypographyType.xlBold,
                      text: 'Bem vindo! Faça seu login abaixo',
                    ),
                  ),
                  SizedBox(
                    height: context.percentHeight(0.1),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: CustomTextField(
                      enable: widget.pageInLoading ? false : true,
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      labelText: 'E-mail',
                      hintText: 'Exemplo@email.com',
                      validation: Validatorless.multiple([
                        Validatorless.email('Insira um e-mail válido'),
                        Validatorless.required('E-mail obrigatório'),
                      ]),
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: CustomTextField(
                      enable: widget.pageInLoading ? false : true,
                      controller: passwordController,
                      hintText: '*******',
                      labelText: 'Senha',
                      suffixIcon: GestureDetector(
                        onTap: () => setObscureText(),
                        child: isObscure
                            ? SvgPicture.asset(
                                'assets/svg/visibility.svg',
                              )
                            : SvgPicture.asset(
                                'assets/svg/eye-slash.svg',
                              ),
                      ),
                      obscureText: isObscure,
                      validation: (password) {
                        if (password == null || password.isEmpty) {
                          return 'Insira sua senha';
                        }
                        if (password.length < 6) {
                          return 'Sua senha deve ter pelo menos 8 caracteres';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                        ),
                        onPressed: () {},
                        child: const CustomText(
                          textType: TypographyType.xsBold,
                          text: 'Esqueceu a senha?',
                          color: primary,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: CustomButton.primary(
                      text: 'ENTRAR',
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          widget.onLogin(
                            emailController.text,
                            passwordController.text,
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomText(
                  textType: TypographyType.smMedium,
                  text: 'Não possui uma conta ainda?',
                  color: fontColor,
                ),
                GestureDetector(
                  onTap: widget.pageInLoading
                      ? null
                      : () => widget.onChangeViewType(),
                  child: const CustomText(
                    textType: TypographyType.smBold,
                    text: ' Registre-se',
                    color: primary,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
