import 'package:drill_app/bootstrap/bootstrap.dart';
import 'package:drill_app/config/route.dart';
import 'package:drill_app/config/theme.dart';
import 'package:drill_app/view/landing.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key}) {
    Bootstrap();
  }

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

