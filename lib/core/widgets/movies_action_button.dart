import 'package:flutter/material.dart';

import 'package:movies_app_leal/core/theme/theme_data.dart';

class MoviesActionButton extends StatelessWidget {
  final IconData icon;
  final Color splashColor;
  final Color iconColor;
  final void Function() function;

  const MoviesActionButton({
    Key? key,
    required this.icon,
    required this.function,
    this.iconColor = white,
    this.splashColor = Colors.transparent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(
        splashRadius: 20,
        onPressed: function,
        icon: Icon(icon),
        color: iconColor,
        splashColor: splashColor,
      ),
    );
  }
}
