import 'package:flutter/material.dart';

mixin ShowModais<T extends StatefulWidget> on State<T> {
  Future<dynamic> showModalBottom(Widget child) async {
    final result = await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      barrierColor: Colors.black38,
      builder: (context) {
        return child;
      },
    );
    return result;
  }

  Future<dynamic> showPopUp(Widget child) async {
    final result = await showDialog(
      context: context,
      barrierColor: Colors.black38,
      builder: (context) {
        return Material(
          color: Colors.transparent,
          child: Center(
            child: child,
          ),
        );
      },
    );
    return result;
  }
}
