import 'package:drill_app/component/bottom_bar.dart';
import 'package:flutter/material.dart';

class Personal extends StatefulWidget {
  const Personal({super.key});

  @override
  State<Personal> createState() => _PersonalState();
}

class _PersonalState extends State<Personal> {
  
  @override
  Widget build(BuildContext context) {
    return const BottomBar(
      title: "Personal",
      selectedIndex: BottomBarIndex.home,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          ],
        ),
      )
    );
  }
}
