import 'package:flutter/material.dart';

import 'package:movies_app_leal/core/theme/theme_data.dart';
import 'package:movies_app_leal/core/widgets/information_container.dart';

class RecentDetailPage extends StatelessWidget {
  const RecentDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        title: const Text(
          "Recent Detail",
          style: TextStyle(color: white),
        ),
        backgroundColor: black,
        elevation: 0,
        centerTitle: false,
      ),
      body: const InformationContainer(icon: Icons.handyman_rounded, message: "Work in progress"),
    );
  }
}
