import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../styles/colors_app.dart';
import '../typography/custom_text.dart';
import '../typography/typography.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final bool enable;
  final String helperText;
  final String? hintText;
  final String labelText;
  final String toolTipText;
  final FocusNode? focus;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validation;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String)? onChanged;

  const CustomTextField({
    Key? key,
    this.controller,
    this.enable = true,
    this.helperText = '',
    this.labelText = '',
    this.toolTipText = '',
    this.focus,
    this.hintText,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.validation,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    this.onChanged,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  Widget? get prefixIcon => widget.prefixIcon == null
      ? null
      : Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 8,
              ),
              child: Center(
                child: SizedBox(
                  height: 24,
                  width: 24,
                  child: widget.prefixIcon,
                ),
              ),
            ),
          ],
        );

  Widget? get suffixIcon => widget.suffixIcon == null
      ? null
      : Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 8,
                right: 16,
              ),
              child: Center(
                child: SizedBox(
                  height: 24,
                  width: 24,
                  child: widget.suffixIcon,
                ),
              ),
            ),
          ],
        );
  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      enabled: widget.enable,
      validator: widget.validation,
      builder: (field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.labelText.isNotEmpty) ...[
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: CustomText(
                  textType: TypographyType.smBold,
                  text: widget.labelText,
                  color: fontColor,
                ),
              ),
              const SizedBox(height: 8),
            ],
            SizedBox(
              height: 45,
              child: TextFormField(
                focusNode: widget.focus,
                enabled: widget.enable,
                controller: widget.controller,
                validator: (value) {
                  final bool hasErro = widget.validation?.call(value) != null;
                  return hasErro ? '' : null;
                },
                onChanged: (value) {
                  widget.onChanged?.call(value);
                  field.didChange(value);
                },
                keyboardType: widget.keyboardType,
                inputFormatters: widget.inputFormatters,
                obscureText: widget.obscureText,
                textAlignVertical: TextAlignVertical.center,
                style: const TextStyle(
                  color: fontColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
                decoration: InputDecoration(
                  hintStyle: const TextStyle(
                    color: fontColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
                  fillColor: grey,
                  filled: true,
                  errorStyle: const TextStyle(height: 0),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  hintText: widget.hintText,
                  prefixIcon: prefixIcon,
                  prefixIconConstraints: const BoxConstraints(
                    maxWidth: 48,
                  ),
                  suffixIconConstraints: const BoxConstraints(
                    maxWidth: 48,
                  ),
                  suffixIcon: suffixIcon,
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: grey,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: grey,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: primary,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: error600,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: error600,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: borderGreyDisable,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
            if (field.hasError && field.errorText?.isNotEmpty == true) ...[
              const SizedBox(height: 12),
              CustomText(
                textType: TypographyType.smRegular,
                text: field.errorText!,
                color: error500,
              ),
            ] else if (widget.helperText.isNotEmpty) ...[
              const SizedBox(height: 12),
              CustomText(
                textType: TypographyType.smRegular,
                text: widget.helperText,
                color: fontColorLigth,
              ),
            ],
          ],
        );
      },
    );
  }
}
