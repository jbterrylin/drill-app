import 'package:drill_app/config/route.dart';
import 'package:drill_app/config/theme.dart';
import 'package:drill_app/view/landing.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drill',
      theme: ThemeConfig().getTheme(),
      home: const Landing(),
      onGenerateRoute: (setting) => RouteConfig().getRoute(setting),
    );
  }
}

