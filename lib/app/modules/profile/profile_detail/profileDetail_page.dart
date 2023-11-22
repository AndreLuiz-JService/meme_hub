import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:meme_hub/app/core/ui/atons/buttons/custom_button.dart';
import 'package:meme_hub/app/core/ui/atons/text_field/custom_text_field.dart';
import 'package:meme_hub/app/core/ui/atons/typography/custom_text.dart';
import 'package:meme_hub/app/core/ui/atons/typography/typography.dart';
import 'package:meme_hub/app/core/ui/styles/colors_app.dart';
import 'package:meme_hub/app/helpers/show_modais.dart';
import 'package:meme_hub/app/modules/profile/profile_detail/profileDetail_store.dart';
import 'package:flutter/material.dart';
import 'package:meme_hub/app/modules/profile/profile_detail/widgets/change_password_widget.dart';
import 'package:validatorless/validatorless.dart';

class ProfileDetailPage extends StatefulWidget {
  const ProfileDetailPage({
    Key? key,
  }) : super(key: key);

  @override
  ProfileDetailPageState createState() => ProfileDetailPageState();
}

class ProfileDetailPageState extends State<ProfileDetailPage> with ShowModais {
  final ProfileDetailStore store = Modular.get();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final birthdayController = TextEditingController();
  final emailController = TextEditingController();
  final usernameController = TextEditingController();

  var maskFormatter = MaskTextInputFormatter(
    mask: '0000-00-00',
    filter: {"0": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  String? newPassWord;
  setNewPassWord(String value) {
    newPassWord = value;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: <Widget>[
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 40,
                          height: 40,
                          child: IconButton(
                              onPressed: () => Modular.to.pop(),
                              icon: const Icon(
                                Icons.arrow_back_rounded,
                              )),
                        ),
                        Column(
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.account_circle_rounded,
                                size: 100,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Center(
                      child: Container(
                        height: 45,
                        width: 207,
                        decoration: BoxDecoration(
                          color: grey,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(left: 13, right: 16),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 24,
                                height: 24,
                                child: Icon(Icons.camera_alt_outlined),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              CustomText(
                                textType: TypographyType.smRegular,
                                text: 'Alterar foto do perfil',
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: CustomTextField(
                        controller: birthdayController,
                        enable: store.profileDetailInLoading ? false : true,
                        inputFormatters: [maskFormatter],
                        labelText: 'Sua data de nascimento',
                        hintText: store.user.birthdayFormated,
                        keyboardType: TextInputType.number,
                        validation: (value) {
                          if (value == null || value.isEmpty) {
                            return null;
                          }
                          return Validatorless.date('Insira uma data válida')(
                              value);
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: CustomTextField(
                        controller: emailController,
                        enable: store.profileDetailInLoading ? false : true,
                        labelText: 'Seu e-mail',
                        hintText: store.user.email,
                        validation: (value) {
                          if (value == null || value.isEmpty) {
                            return null;
                          }
                          return Validatorless.email(
                              'Insira um e-mail válido')(value);
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: CustomTextField(
                        controller: usernameController,
                        enable: store.profileDetailInLoading ? false : true,
                        labelText: 'Seu nome de usuário',
                        hintText: store.user.username,
                        prefixIcon: SvgPicture.asset('assets/svg/email.svg'),
                      ),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 16),
                            child: CustomText(
                              textType: TypographyType.smBold,
                              text: 'Sua senha',
                              color: fontColor,
                            ),
                          ),
                          const SizedBox(height: 8),
                          GestureDetector(
                            onTap: () {
                              showModalBottom(ChangePasswordWidget(
                                  onSubmit: setNewPassWord));
                            },
                            child: Container(
                              height: 45,
                              decoration: BoxDecoration(
                                color: grey,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 13, right: 16),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 24,
                                      height: 24,
                                      child: SvgPicture.asset(
                                        'assets/svg/lock.svg',
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    const CustomText(
                                      textType: TypographyType.smRegular,
                                      text: 'Alterar minha senha',
                                    ),
                                    const Spacer(),
                                    const SizedBox(
                                      width: 24,
                                      height: 24,
                                      child: Icon(
                                        Icons.arrow_forward_rounded,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Observer(
                builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: CustomButton.primary(
                      text: 'SALVAR',
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          store.updateUser(
                            username: usernameController.text,
                            birthday: birthdayController.text,
                            email: emailController.text,
                            newPassWord: newPassWord,
                          );
                        }
                      },
                    ),
                  );
                }
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
