import 'package:flutter/material.dart';

enum TypographyType {
  xsRegular,
  xsMedium,
  xsBold,
  smRegular,
  smMedium,
  smButton,
  smLink,
  smBold,
  baseRegular,
  baseMedium,
  baseBold,
  baseButton,
  lgRegular,
  lgMedium,
  lgBold,
  lgButton,
  xlRegular,
  xlMedium,
  xlBold,
  xxlRegular,
  xxlMedium,
  xxlBold,
  xxxlRegular,
  xxxlMedium,
  xxxlBold,
}

extension TextStyleExtension on TypographyType {
  TextStyle get style {
    double fontSize;
    FontWeight fontWeight;
    FontStyle fontStyle;
    double? lineheight;

    switch (this) {
      // TextXs
      case TypographyType.xsRegular:
        fontSize = 12;
        fontWeight = FontWeight.w400;
        fontStyle = FontStyle.normal;
        lineheight = 1;
        break;
      case TypographyType.xsMedium:
        fontSize = 12;
        fontWeight = FontWeight.w500;
        fontStyle = FontStyle.normal;
        lineheight = 1;
        break;
      case TypographyType.xsBold:
        fontSize = 12;
        fontWeight = FontWeight.w700;
        fontStyle = FontStyle.normal;
        lineheight = 1;
        break;
      // TextSm
      case TypographyType.smRegular:
        fontSize = 14;
        fontWeight = FontWeight.w400;
        fontStyle = FontStyle.normal;
        lineheight = 1.25;
        break;
      case TypographyType.smMedium:
        fontSize = 14;
        fontWeight = FontWeight.w500;
        fontStyle = FontStyle.normal;
        lineheight = 1.25;
        break;
      case TypographyType.smBold:
        fontSize = 14;
        fontWeight = FontWeight.w700;
        fontStyle = FontStyle.normal;
        lineheight = 1.25;
        break;
      case TypographyType.smLink:
        fontSize = 14;
        fontWeight = FontWeight.w500;
        fontStyle = FontStyle.normal;
        lineheight = 1.25;
        break;
      case TypographyType.smButton:
        fontSize = 14;
        fontWeight = FontWeight.w600;
        fontStyle = FontStyle.normal;
        break;
      // TextBase
      case TypographyType.baseRegular:
        fontSize = 16;
        fontWeight = FontWeight.w400;
        fontStyle = FontStyle.normal;
        lineheight = 1.5;
        break;
      case TypographyType.baseMedium:
        fontSize = 16;
        fontWeight = FontWeight.w500;
        fontStyle = FontStyle.normal;
        lineheight = 1.5;
        break;
      case TypographyType.baseBold:
        fontSize = 16;
        fontWeight = FontWeight.w700;
        fontStyle = FontStyle.normal;
        lineheight = 1.5;
        break;
      case TypographyType.baseButton:
        fontSize = 16;
        fontWeight = FontWeight.w600;
        fontStyle = FontStyle.normal;
        break;
      // TextLg
      case TypographyType.lgRegular:
        fontSize = 18;
        fontWeight = FontWeight.w400;
        fontStyle = FontStyle.normal;
        lineheight = 1.75;
        break;
      case TypographyType.lgMedium:
        fontSize = 18;
        fontWeight = FontWeight.w500;
        fontStyle = FontStyle.normal;
        lineheight = 1.75;
        break;
      case TypographyType.lgBold:
        fontSize = 18;
        fontWeight = FontWeight.w700;
        fontStyle = FontStyle.normal;
        lineheight = 1.75;
        break;
      case TypographyType.lgButton:
        fontSize = 18;
        fontWeight = FontWeight.w600;
        fontStyle = FontStyle.normal;
        break;
      // TextXl
      case TypographyType.xlRegular:
        fontSize = 20;
        fontWeight = FontWeight.w400;
        fontStyle = FontStyle.normal;
        lineheight = 1.75;
        break;
      case TypographyType.xlMedium:
        fontSize = 20;
        fontWeight = FontWeight.w500;
        fontStyle = FontStyle.normal;
        lineheight = 1.75;
        break;
      case TypographyType.xlBold:
        fontSize = 20;
        fontWeight = FontWeight.w700;
        fontStyle = FontStyle.normal;
        lineheight = 1.75;
        break;
      // TextXxl
      case TypographyType.xxlRegular:
        fontSize = 24;
        fontWeight = FontWeight.w400;
        fontStyle = FontStyle.normal;
        lineheight = 2;
        break;
      case TypographyType.xxlMedium:
        fontSize = 24;
        fontWeight = FontWeight.w500;
        fontStyle = FontStyle.normal;
        lineheight = 2;
        break;
      case TypographyType.xxlBold:
        fontSize = 24;
        fontWeight = FontWeight.w700;
        fontStyle = FontStyle.normal;
        lineheight = 2;
        break;
      // TextXxxl
      case TypographyType.xxxlRegular:
        fontSize = 28;
        fontWeight = FontWeight.w400;
        fontStyle = FontStyle.normal;
        lineheight = 2;
        break;
      case TypographyType.xxxlMedium:
        fontSize = 28;
        fontWeight = FontWeight.w500;
        fontStyle = FontStyle.normal;
        lineheight = 2;
        break;
      case TypographyType.xxxlBold:
        fontSize = 28;
        fontWeight = FontWeight.w700;
        fontStyle = FontStyle.normal;
        lineheight = 2;
        break;
    }

    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      height: lineheight,
    );
  }
}
