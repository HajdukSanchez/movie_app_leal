import 'package:flutter/material.dart';

import 'package:movies_app_leal/core/theme/theme_data.dart';

class MoviesTitle extends StatelessWidget {
  final String text;
  final double? fontSize;
  final bool centered;

  const MoviesTitle({Key? key, required this.text, this.fontSize = 18, this.centered = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      alignment: centered ? Alignment.center : Alignment.centerLeft,
      child: Text(text,
          style: TextStyle(
            color: white,
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          )),
    );
  }
}
