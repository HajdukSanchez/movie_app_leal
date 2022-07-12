import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:movies_app_leal/core/theme/theme_data.dart';

/// This function help us to show alters dialogs.
///
/// Dialog will show depends on the platform.
void showDialogMessage(
  BuildContext context,
  String title, {
  String message = "",
  IconData icon = Icons.do_disturb_alt_rounded,
}) {
  if (Platform.isAndroid) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(
          title,
          style: const TextStyle(color: yellow),
        ),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              message,
              style: const TextStyle(color: white),
            ),
            Icon(
              icon,
              color: yellow,
              size: 30,
            )
          ],
        ),
        backgroundColor: grey,
      ),
      barrierDismissible: true,
    );
  } else if (Platform.isIOS) {
    showCupertinoDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(
          title,
          style: const TextStyle(color: yellow, fontWeight: FontWeight.bold),
        ),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              message,
              style: const TextStyle(color: white),
            ),
            Icon(
              icon,
              color: yellow,
              size: 30,
            )
          ],
        ),
        backgroundColor: grey,
      ),
      barrierDismissible: true,
    );
  }
}
