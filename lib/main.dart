import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movies_app_leal/core/routes/routes.dart';
import 'package:movies_app_leal/features/auth/presentation/bloc/blocs.dart';
import 'package:movies_app_leal/injection_dependecy_container.dart' as di;

void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.light)); // status bar color

  WidgetsFlutterBinding
      .ensureInitialized(); // It is important to add this, to ensure not to have problems with Futures initialized the injection container
  await di.init(); // Initialize the dependency injection container

  runApp(
    BlocProvider(
      create: (BuildContext context) => di.sl<AuthBloc>(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      routes: routes,
      theme: ThemeData.dark().copyWith(
        textTheme: ThemeData.dark().textTheme.apply(
              fontFamily: 'Gilroy',
            ),
      ),
      initialRoute: RoutesPages.loading.name,
    );
  }
}
