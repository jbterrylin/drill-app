import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:drill_app/constant/constant.dart' as constant;

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  init() async {
    String? token = await _secureStorage.read(key: constant.token);
    if (token == null) {

    } else {
      
    }
  }

  _LandingState() {
    init();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Loading',
            ),
          ],
        ),
      ),
    );
  }
}
