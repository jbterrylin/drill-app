import 'package:drill_app/constant/router.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

enum BottomBarIndex {
  home,
  myDrill,
  personal,
  tokenManager,
}

class BottomBar extends StatefulWidget {
  const BottomBar(
      {super.key,
      required this.title,
      required this.selectedIndex,
      required this.body});

  final String title;
  final BottomBarIndex selectedIndex;
  final Widget body;

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  final log = Logger('BottomBar');

  void _onItemTapped(int index) {
    final selectedTab = BottomBarIndex.values[index];
    switch (selectedTab) {
      case BottomBarIndex.home:
        Navigator.pushReplacementNamed(context, home);
        break;
      case BottomBarIndex.myDrill:
        Navigator.pushReplacementNamed(context, myDrill);
        break;
      case BottomBarIndex.personal:
        Navigator.pushReplacementNamed(context, personal);
      case BottomBarIndex.tokenManager:
        Navigator.pushReplacementNamed(context, tokenManager);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: widget.body,
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
        currentIndex: widget.selectedIndex.index,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).colorScheme.inversePrimary,
        onTap: _onItemTapped,
      ),
    );
  }
}
