import 'package:animations/animations.dart';
import 'package:drill_app/constant/design.dart';
import 'package:drill_app/view/home.dart';
import 'package:drill_app/view/my_drill/my_drill.dart';
import 'package:drill_app/view/personal.dart';
import 'package:drill_app/view/token_manager.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

enum BottomBarIndex {
  home,
  myDrill,
  personal,
  tokenManager,
}

class Page {
  Widget title;
  Widget body;

  Page({
    required this.title,
    required this.body,
  });
}

class BottomBar extends StatefulWidget {
  const BottomBar({super.key, required this.selectedIndex});

  final BottomBarIndex selectedIndex;

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  final log = Logger('BottomBar');

  late BottomBarIndex selectedTab;
  late Map<BottomBarIndex, Page> body;

  @override
  void initState() {
    super.initState();
    selectedTab = widget.selectedIndex;
    body = {
      BottomBarIndex.home: Page(
        title: const Text("Home"),
        body: const UiHome(),
      ),
      BottomBarIndex.myDrill: Page(
        title: const Text("MyDrill"),
        body: const UiMyDrill(),
      ),
      BottomBarIndex.personal: Page(
        title: const Text("Personal"),
        body: const UiPersonal(),
      ),
      BottomBarIndex.tokenManager: Page(
        title: const Text("TokenManager"),
        body: const UiTokenManager(),
      ),
    };
    init();
  }

  void init() async {}

  void _onItemTapped(int index) {
    selectedTab = BottomBarIndex.values[index];
    setState(() {
      selectedTab;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: const SizedBox(),
        leadingWidth: 0,
        centerTitle: false,
        title: const Text("Drill"),
      ),
      body: PageTransitionSwitcher(
        duration: defaultDuration,
        transitionBuilder: (child, animation, secondAnimation) {
          return FadeThroughTransition(
            animation: animation,
            secondaryAnimation: secondAnimation,
            child: child,
          );
        },
        child: body[BottomBarIndex.values[selectedTab.index]]!.body,
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(top: defaultPadding / 2),
        color: Theme.of(context).brightness == Brightness.light
            ? Colors.white
            : const Color(0xFF101015),
        child: BottomNavigationBar(
          currentIndex: selectedTab.index,
          onTap: _onItemTapped,
          backgroundColor: Theme.of(context).brightness == Brightness.light
              ? Colors.white
              : const Color(0xFF101015),
          type: BottomNavigationBarType.fixed,
          // selectedLabelStyle: TextStyle(color: primaryColor),
          selectedFontSize: 12,
          selectedItemColor: primaryColor,
          unselectedItemColor: primaryMaterialColor[200],
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              activeIcon: Icon(Icons.home, color: primaryColor),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              activeIcon: Icon(Icons.business, color: primaryColor),
              label: "Drill",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              activeIcon: Icon(Icons.school, color: primaryColor),
              label: "Personal",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              activeIcon: Icon(Icons.school, color: primaryColor),
              label: "Token",
            ),
          ],
        ),
      ),
    );
  }
}
