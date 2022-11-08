import 'package:app_demo/app/app_routes.dart';
import 'package:app_demo/app/presentation/screen/demo_audio_player.dart';
import 'package:app_demo/app/presentation/screen/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // initialRoute: AppRoutes.flipAnimation,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: AppRoutes.onGenerateRoute,
      home:  HomePage(),
    );
  }
}
