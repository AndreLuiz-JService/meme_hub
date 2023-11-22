import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meme_hub/app/core/ui/atons/buttons/custom_button.dart';
import 'package:meme_hub/app/core/ui/atons/text_field/custom_text_field.dart';
import 'package:meme_hub/app/core/ui/styles/colors_app.dart';

class ChangePasswordWidget extends StatefulWidget {
  const ChangePasswordWidget({super.key, required this.onSubmit});

  final Function(String newPassowrd) onSubmit;

  @override
  State<ChangePasswordWidget> createState() => _ChangePasswordWidgetState();
}

class _ChangePasswordWidgetState extends State<ChangePasswordWidget>
    with WidgetsBindingObserver {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final passwordController = TextEditingController();
  final passwordController2 = TextEditingController();

  bool isObscure = true;
  setObscureText() {
    setState(() => isObscure = !isObscure);
  }

  double modalOffset = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    final keyboardHeight = View.of(context).viewInsets.bottom;
    setState(
      () {
        modalOffset = keyboardHeight == 0 ? 0 : 260;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 436 + modalOffset,
      decoration: const BoxDecoration(
        color: colorWhite,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10),
        ),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.close,
                      ),
                    ),
                  ),
                  Container(
                    height: 5,
                    width: 90,
                    decoration: BoxDecoration(
                      color: grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                   
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: CustomTextField(
                controller: passwordController,
                labelText: 'Digite sua nova senha',
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
                labelText: 'Confirme sua nova senha',
                hintText: '********',
                obscureText: isObscure,
                validation: (password) {
                  if (password == null || password.isEmpty) {
                    return 'Insira sua senha';
                  }
                  if (password.length < 6) {
                    return 'Sua senha deve ter pelo menos 6 caracteres';
                  }
                  if (passwordController.text != passwordController2.text) {
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
              height: 36,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: CustomButton.primary(
                text: 'SALVAR',
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    widget.onSubmit(passwordController.text);
                    Navigator.pop(context);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
