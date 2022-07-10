import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:movies_app_leal/core/routes/routes.dart';
import 'package:movies_app_leal/injection_dependecy_container.dart' as di;

void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark)); // status bar color

  WidgetsFlutterBinding
      .ensureInitialized(); // It is important to add this, to ensure not to have problems with Futures initialized the injection container
  await di.init(); // Initialize the dependency injection container

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      routes: routes,
      initialRoute: RoutesPages.login.name,
    );
  }
}

// const theme = ThemeData.dark().copyWith();