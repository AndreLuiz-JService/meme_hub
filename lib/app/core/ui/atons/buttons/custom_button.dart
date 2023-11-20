import 'package:flutter/material.dart';
import 'package:meme_hub/app/core/ui/atons/typography/typography.dart';

import '../../extensions/size_extensions.dart';
import '../../styles/colors_app.dart';
import '../typography/custom_text.dart';

class CustomButton extends StatefulWidget {
  final VoidCallback? onTap;
  final Color backGroundColor;
  final Color disabledBackgroundColor;
  final Color houveColor;
  final Color textColor;
  final Color houverTextColor;
  final Color disableTextColor;
  final Color? borderColor;
  final Color? disableBorderColor;
  final String text;
  final double? width;
  const CustomButton({
    Key? key,
    this.onTap,
    this.backGroundColor = colorWhite,
    this.houveColor = grey,
    this.disabledBackgroundColor = colorWhite,
    this.textColor = fontColor,
    this.houverTextColor = fontColorbold,
    this.disableTextColor = fontColorLigth,
    this.borderColor = borderGrey,
    this.disableBorderColor = borderGreyDisable,
    required this.text,
    this.width,
  }) : super(key: key);

  factory CustomButton.primary({
    Key? key,
    required String text,
    double? width,
    VoidCallback? onTap,
  }) {
    return CustomButton(
      key: key,
      backGroundColor: primary,
      disabledBackgroundColor: primarylight,
      houveColor: primaryBold,
      text: text,
      borderColor: null,
      onTap: onTap,
      textColor: colorWhite,
      houverTextColor: colorWhite,
      disableTextColor: colorWhite,
      width: width,
    );
  }

  factory CustomButton.danger({
    required String text,
    double? width,
    VoidCallback? onTap,
  }) {
    return CustomButton(
      backGroundColor: error600,
      disabledBackgroundColor: error200,
      houveColor: error700,
      text: text,
      borderColor: null,
      onTap: onTap,
      textColor: colorWhite,
      houverTextColor: colorWhite,
      disableTextColor: colorWhite,
      width: width,
    );
  }

  factory CustomButton.borderNone({
    Key? key,
    required String text,
    double? width,
    VoidCallback? onTap,
    Color backGroundColor = colorWhite,
    Color textColor = fontColor,
    Color houverTextColor = fontColorbold,
    Color disableTextColor = fontColorLigth,
  }) {
    return CustomButton(
      key: key,
      backGroundColor: backGroundColor,
      disabledBackgroundColor: backGroundColor,
      houveColor: backGroundColor,
      text: text,
      borderColor: null,
      onTap: onTap,
      textColor: textColor,
      houverTextColor: houverTextColor,
      disableTextColor: disableTextColor,
      width: width,
    );
  }

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool isPressed = false;
  void changeIsPressed(bool value) {
    setState(() => isPressed = value);
  }

  bool get isDisabled => widget.onTap == null;

  Color get backGroundColor => isDisabled
      ? widget.disabledBackgroundColor
      : isPressed
          ? widget.houveColor
          : widget.backGroundColor;

  Color get textColor => isDisabled
      ? widget.disableTextColor
      : isPressed
          ? widget.houverTextColor
          : widget.textColor;

  Color? get borderColor =>
      isDisabled ? widget.disableBorderColor : widget.borderColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onTap?.call(),
      onLongPressUp: () => widget.onTap?.call(),
      onTapDown: (details) => changeIsPressed(true),
      onTapUp: (details) => changeIsPressed(false),
      onPanEnd: (details) => changeIsPressed(false),
      onLongPressEnd: (details) => changeIsPressed(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        height: 40,
        width: widget.width ?? context.screenWidth,
        decoration: BoxDecoration(
          color: backGroundColor,
          border: Border.all(color: borderColor ?? backGroundColor),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: CustomText(
            textType: TypographyType.smBold,
            text: widget.text,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
