import 'package:flutter/material.dart';
import 'package:meme_hub/app/core/ui/atons/typography/custom_text.dart';
import 'package:meme_hub/app/core/ui/atons/typography/typography.dart';
import 'package:meme_hub/app/core/ui/styles/colors_app.dart';

class SelectViewState extends StatelessWidget {
  const SelectViewState(
      {super.key,
      required this.isSelect,
      required this.borderLeft,
      required this.quantity,
      required this.title, required this.onTap});

  final bool isSelect;
  final bool borderLeft;
  final int quantity;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border(
            bottom: isSelect
                ? const BorderSide(color: primary, width: 2)
                : const BorderSide(color: borderGrey, width: 1),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 40,
              width: 1,
              color: (!isSelect && borderLeft) ? borderGrey : Colors.transparent,
            ),
            Column(
              children: [
                CustomText(
                  textType: TypographyType.baseBold,
                  text: quantity.toString(),
                  color: isSelect ? primary : fontColor,
                ),
                CustomText(
                  textType: TypographyType.smRegular,
                  text: title,
                  color: isSelect ? primary : fontColor,
                ),
              ],
            ),
            Container(
              height: 40,
              width: 1,
              color: (!isSelect && !borderLeft) ? borderGrey : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
