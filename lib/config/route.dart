import 'package:drill_app/view/home.dart';
import 'package:drill_app/view/landing.dart';
import 'package:drill_app/view/login.dart';
import 'package:drill_app/view/register.dart';
import 'package:flutter/material.dart';

class RouteConfig {
  MaterialPageRoute getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (context) => const Landing(),
        );
      case "/register":
        return MaterialPageRoute(
          builder: (context) => const Register(),
        );
      case "/login":
        return MaterialPageRoute(
          builder: (context) => const Login(),
        );
      case "/home":
        return MaterialPageRoute(
          builder: (context) => const Home(),
        );
    }

    return MaterialPageRoute(
      builder: (context) => const Login(),
    );
  }
}
