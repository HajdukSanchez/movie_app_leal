import 'package:flutter/material.dart';

import 'package:movies_app_leal/core/theme/theme_data.dart';

class ListSeparator extends StatelessWidget {
  final EdgeInsetsGeometry margin;

  const ListSeparator({
    Key? key,
    this.margin = const EdgeInsets.symmetric(vertical: 20),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 0.5, color: grey),
        ),
      ),
    );
  }
}
