import 'package:drill_app/component/bottom_bar.dart';
import 'package:drill_app/constant/router.dart';
import 'package:drill_app/view/home.dart';
import 'package:drill_app/view/landing.dart';
import 'package:drill_app/view/login.dart';
import 'package:drill_app/view/my_drill.dart';
import 'package:drill_app/view/personal.dart';
import 'package:drill_app/view/register.dart';
import 'package:drill_app/view/token_manager.dart';
import 'package:flutter/material.dart';

class RouteConfig {
  MaterialPageRoute getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case landing:
        return MaterialPageRoute(
          builder: (context) => const Landing(),
        );
      case register:
        return MaterialPageRoute(
          builder: (context) => const Register(),
        );
      case login:
        return MaterialPageRoute(
          builder: (context) => const Login(),
        );
      case home:
        return MaterialPageRoute(
          builder: (context) =>
              const BottomBar(selectedIndex: BottomBarIndex.home),
        );
      case personal:
        return MaterialPageRoute(
          builder: (context) =>
              const BottomBar(selectedIndex: BottomBarIndex.personal),
        );
      case myDrill:
        return MaterialPageRoute(
          builder: (context) =>
              const BottomBar(selectedIndex: BottomBarIndex.myDrill),
        );
      case tokenManager:
        return MaterialPageRoute(
          builder: (context) =>
              const BottomBar(selectedIndex: BottomBarIndex.tokenManager),
        );
    }

    return MaterialPageRoute(
      builder: (context) => const Login(),
    );
  }
}
