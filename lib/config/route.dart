import 'package:drill_app/component/bottom_bar.dart';
import 'package:drill_app/constant/router.dart';
import 'package:drill_app/view/create_event.dart';
import 'package:drill_app/view/create_group.dart';
import 'package:drill_app/view/event/event.dart';
import 'package:drill_app/view/group/group.dart';
import 'package:drill_app/view/landing.dart';
import 'package:drill_app/view/login.dart';
import 'package:drill_app/view/register.dart';
import 'package:flutter/material.dart';

class RouteConfig {
  MaterialPageRoute getRoute(RouteSettings routeSettings) {
    Map<String, dynamic>? arguments;
    if (routeSettings.arguments != null) {
      arguments = routeSettings.arguments as Map<String, dynamic>;
    }
    switch (routeSettings.name) {
      case landing:
        return MaterialPageRoute(
          builder: (context) => const UiLanding(),
        );
      case register:
        return MaterialPageRoute(
          builder: (context) => const UiRegister(),
        );
      case login:
        return MaterialPageRoute(
          builder: (context) => const UiLogin(),
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
      case createGroup:
        return MaterialPageRoute(
          builder: (context) => const UiCreateGroup(),
        );
      case group:
        return MaterialPageRoute(
          builder: (context) =>
              UiGroup(groupId: arguments?[uiGroupInitFieldGroupId] ?? 0),
        );
      case createEvent:
        return MaterialPageRoute(
          builder: (context) => UiCreateEvent(groupId: arguments?[uiCreateEventInitFieldGroupId] ?? 0),
        );
      case event:
        return MaterialPageRoute(
          builder: (context) =>
              UiEvent(eventId: arguments?[uiEventInitFieldEventId] ?? 0),
        );
    }

    return MaterialPageRoute(
      builder: (context) => const UiLogin(),
    );
  }
}
