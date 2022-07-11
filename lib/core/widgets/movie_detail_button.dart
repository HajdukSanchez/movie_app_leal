import 'package:flutter/material.dart';

import 'package:movies_app_leal/core/theme/theme_data.dart';

class MovieDetailButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  const MovieDetailButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: GestureDetector(
        onTap: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              text,
              style: const TextStyle(color: yellow, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: 10,
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 15,
              color: yellow,
            ),
          ],
        ),
      ),
    );
  }
}
