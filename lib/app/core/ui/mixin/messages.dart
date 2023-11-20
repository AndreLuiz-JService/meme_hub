import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../atons/typography/typography.dart';
import '../styles/colors_app.dart';

mixin Messages<Object extends StatefulWidget> on State<Object> {
  void showError(
    String? message, {
    Color? backGroundColor,
    TextStyle? textStyle,
  }) {
    _showSnackBar(
      CustomSnackBar.error(
        message: message ?? 'Erro desconhecido',
        maxLines: 3,
        backgroundColor: backGroundColor ?? error100,
        icon: const Icon(
          Icons.error,
          color: error500,
          size: 30,
        ),
        iconRotationAngle: 0,
        textStyle: textStyle ??
            TypographyType.smMedium.style.copyWith(
              color: fontColorbold,
            ),
        iconPositionLeft: 12,
        messagePadding: const EdgeInsets.symmetric(horizontal: 48),
      ),
    );
  }

  void showWarning(String message) {
    _showSnackBar(
      CustomSnackBar.error(
        message: message,
        maxLines: 3,
        backgroundColor: warning50,
        icon: const Icon(
          Icons.warning,
          color: warning500,
          size: 30,
        ),
        iconRotationAngle: 0,
        textStyle: TypographyType.smMedium.style.copyWith(
          color: fontColorbold,
        ),
        iconPositionLeft: 12,
        messagePadding: const EdgeInsets.symmetric(horizontal: 48),
      ),
    );
  }

  void showInfo(String message) {
    _showSnackBar(
      CustomSnackBar.info(
        message: message,
        maxLines: 3,
        backgroundColor: info100,
        icon: const Icon(
          Icons.info,
          color: info500,
          size: 30,
        ),
        iconRotationAngle: 0,
        textStyle: TypographyType.smMedium.style.copyWith(
          color: fontColorbold,
        ),
        iconPositionLeft: 12,
        messagePadding: const EdgeInsets.symmetric(horizontal: 48),
      ),
    );
  }

  void showSuccess(String message) {
    _showSnackBar(
      CustomSnackBar.success(
        message: message,
        maxLines: 3,
        backgroundColor: success50,
        icon: const Icon(
          Icons.check,
          color: success500,
          size: 30,
        ),
        iconRotationAngle: 0,
        textStyle: TypographyType.smMedium.style.copyWith(
          color: fontColorbold,
        ),
        iconPositionLeft: 12,
        messagePadding: const EdgeInsets.symmetric(horizontal: 48),
      ),
    );
  }

  void _showSnackBar(Widget content) {
    showTopSnackBar(
      Overlay.of(context),
      content,
      animationDuration: const Duration(milliseconds: 1500),
      displayDuration: const Duration(seconds: 4),
    );
  }
}
