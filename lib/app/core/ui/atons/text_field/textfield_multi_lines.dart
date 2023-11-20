import 'package:flutter/material.dart';
import '../../styles/colors_app.dart';

class TextFielMultiLines extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType inputType;
  final Function()? validateField;
  final String? hintText;
  const TextFielMultiLines({
    Key? key,
    required this.controller,
    this.inputType = TextInputType.text,
    this.validateField,
    this.hintText,
  }) : super(key: key);

  @override
  State<TextFielMultiLines> createState() => _TextFielMultiLinesState();
}

class _TextFielMultiLinesState extends State<TextFielMultiLines> {
  final FocusNode _focus = FocusNode();

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    super.dispose();
    _focus.removeListener(_onFocusChange);
    _focus.dispose();
  }

  void _onFocusChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.inputType,
      focusNode: _focus,
      controller: widget.controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: grey,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: grey,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: primary,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: error600,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: error600,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: borderGreyDisable,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        hintText: widget.hintText ?? '',
      ),
      maxLines: null,
    );
  }
}
