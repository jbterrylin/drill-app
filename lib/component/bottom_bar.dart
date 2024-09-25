import 'package:drill_app/view/home.dart';
import 'package:drill_app/view/my_drill.dart';
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

  void init() async {
  }

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
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: body[BottomBarIndex.values[selectedTab.index]]!.title,
      ),
      body: body[BottomBarIndex.values[selectedTab.index]]!.body,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Personal',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Token',
          ),
        ],
        currentIndex: selectedTab.index,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).colorScheme.inversePrimary,
        onTap: _onItemTapped,
      ),
    );
  }
}
