import 'package:flutter/material.dart';

import 'package:movies_app_leal/core/theme/theme_data.dart';

class MoviesTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  final void Function(String)? onSubmitted;

  const MoviesTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.onSubmitted,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: const BoxDecoration(
          border: Border(
        bottom: BorderSide(width: 1.5, color: grey),
      )),
      child: TextField(
        autofocus: true,
        obscureText: obscureText,
        keyboardType: TextInputType.text,
        controller: controller,
        onSubmitted: onSubmitted,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: grey),
          focusedBorder: InputBorder.none,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
