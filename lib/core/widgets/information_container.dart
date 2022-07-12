import 'package:flutter/material.dart';

import 'package:movies_app_leal/core/theme/theme_data.dart';

class InformationContainer extends StatelessWidget {
  final IconData icon;
  final String message;
  final double iconSize;

  const InformationContainer({
    Key? key,
    required this.icon,
    required this.message,
    this.iconSize = 50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Container(
      width: media.width,
      height: media.height * 0.7,
      padding: const EdgeInsets.all(30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Icon(
                icon,
                size: iconSize,
                color: grey,
              ),
            ),
            Text(
              message,
              style: TextStyle(fontSize: iconSize / 2, color: grey),
            ),
          ],
        ),
      ),
    );
  }
}
