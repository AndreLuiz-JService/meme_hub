import 'package:flutter/widgets.dart';
import 'package:meme_hub/app/core/ui/styles/colors_app.dart';
import 'typography.dart';

class CustomText extends StatelessWidget {
  final TypographyType textType;
  final String text;
  final Color color;
  final String? fontFamily;
  final TextAlign textAlign;
  final TextOverflow? overflow;
  final int? maxLines;

  const CustomText({
    Key? key,
    required this.textType,
    required this.text,
    this.color = fontColor,
    this.fontFamily,
    this.textAlign = TextAlign.start,
    this.overflow,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textType.style.copyWith(
        color: color,
        fontFamily: fontFamily,
      ),
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}
