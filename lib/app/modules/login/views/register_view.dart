import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:meme_hub/app/core/ui/atons/buttons/custom_button.dart';
import 'package:meme_hub/app/core/ui/atons/text_field/custom_text_field.dart';
import 'package:meme_hub/app/core/ui/atons/typography/custom_text.dart';
import 'package:meme_hub/app/core/ui/atons/typography/typography.dart';
import 'package:meme_hub/app/core/ui/extensions/size_extensions.dart';
import 'package:meme_hub/app/core/ui/styles/colors_app.dart';
import 'package:validatorless/validatorless.dart';

class RegisterViewPage extends StatefulWidget {
  const RegisterViewPage(
      {super.key,
      required this.onChangeViewType,
      required this.onLogin,
      required this.pageInLoading});

  final VoidCallback onChangeViewType;
  final Future<void> Function(
      String email, String password, String birthday, String username) onLogin;
  final bool pageInLoading;

  @override
  State<RegisterViewPage> createState() => _RegisterViewPageState();
}

class _RegisterViewPageState extends State<RegisterViewPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final birthdayController = TextEditingController();
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordController2 = TextEditingController();

  var maskFormatter = MaskTextInputFormatter(
      mask: '0000-00-00',
      filter: {"0": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  bool isObscure = true;
  setObscureText() {
    setState(() => isObscure = !isObscure);
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
                  const SizedBox(
                    height: 24,
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
                    height: 24,
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: CustomText(
                      textType: TypographyType.xlBold,
                      text: 'Preencha os dados e registre-se',
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: CustomTextField(
                      controller: birthdayController,
                      enable: widget.pageInLoading ? false : true,
                      inputFormatters: [maskFormatter],
                      labelText: 'Sua data de nascimento',
                      hintText: '2002/26/01',
                      keyboardType: TextInputType.number,
                      validation: Validatorless.multiple(
                        [
                          Validatorless.required('Data obrigatória'),
                          Validatorless.date('Insira uma data válida'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: CustomTextField(
                      controller: emailController,
                      enable: widget.pageInLoading ? false : true,
                      labelText: 'Seu e-mail',
                      hintText: 'Exemplo@email.com',
                      validation: Validatorless.multiple(
                        [
                          Validatorless.required('E-mail obrigatório'),
                          Validatorless.email('Insira um e-mail válido'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: CustomTextField(
                      controller: usernameController,
                      enable: widget.pageInLoading ? false : true,
                      labelText: 'Seu nome de usuário',
                      hintText: 'Usuario 1',
                      validation: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Insira seu nome de usuário';
                        }
                        return null;
                      },
                      prefixIcon: SvgPicture.asset('assets/svg/email.svg'),
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: CustomTextField(
                      controller: passwordController,
                      enable: widget.pageInLoading ? false : true,
                      labelText: 'Digite a senha desejada',
                      hintText: '********',
                      obscureText: isObscure,
                      validation: (password) {
                        if (password == null || password.isEmpty) {
                          return 'Insira sua senha';
                        }
                        if (password.length < 6) {
                          return 'Sua senha deve ter pelo menos 6 caracteres';
                        }
                        return null;
                      },
                      prefixIcon: SvgPicture.asset('assets/svg/lock.svg'),
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
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: CustomTextField(
                      controller: passwordController2,
                      enable: widget.pageInLoading ? false : true,
                      labelText: 'Confirme sua senha',
                      hintText: '********',
                      obscureText: isObscure,
                      validation: (password) {
                        if (password == null || password.isEmpty) {
                          return 'Insira sua senha';
                        }
                        if (password.length < 6) {
                          return 'Sua senha deve ter pelo menos 6 caracteres';
                        }
                        if (passwordController.text !=
                            passwordController2.text) {
                          return 'As senhas devem ser iguais';
                        }
                        return null;
                      },
                      prefixIcon: SvgPicture.asset('assets/svg/lock.svg'),
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
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: CustomButton.primary(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          widget.onLogin(
                            emailController.text,
                            passwordController.text,
                            birthdayController.text,
                            usernameController.text,
                          );
                        }
                      },
                      text: 'REGISTRAR',
                    ),
                  ),
                  const SizedBox(
                    height: 52,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomText(
                        textType: TypographyType.smMedium,
                        text: 'Já possui uma conta? ',
                        color: fontColor,
                      ),
                      GestureDetector(
                        onTap: () => widget.onChangeViewType(),
                        child: const CustomText(
                          textType: TypographyType.smBold,
                          text: ' Faça login',
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
          ],
        ),
      ),
    );
  }
}
