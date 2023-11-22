import 'package:flutter/material.dart';
import 'package:meme_hub/app/core/ui/styles/colors_app.dart';

class ChangePasswordWidget extends StatelessWidget {
  const ChangePasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 436,
      decoration: const BoxDecoration(
        color: colorWhite,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10),
        ),
      ),
    );
  }
}
