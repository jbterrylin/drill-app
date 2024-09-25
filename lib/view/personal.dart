import 'package:drill_app/constant/router.dart';
import 'package:drill_app/state/me.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:drill_app/constant/constant.dart' as constant;
import 'package:get_it/get_it.dart';

class UiPersonal extends StatefulWidget {
  const UiPersonal({super.key});

  @override
  State<UiPersonal> createState() => _UiPersonalState();
}

class _UiPersonalState extends State<UiPersonal> {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {}

  Future<void> _logout() async {
    await _secureStorage.delete(key: constant.token);
    if (mounted) {
      Navigator.pushReplacementNamed(context, login);
    }
  }

  List<Widget> _meCard() {
    return [
      Card(
          child: ListTile(
        title: Text(GetIt.I<MeController>().getMe()?.username ?? ""),
      )),
    ];
  }

  List<Widget> _other() {
    return [
      ListTile(
        title: const Text('Logout'),
        tileColor: Colors.red,
        onTap: () {
          _logout();
        },
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: RefreshIndicator(
            onRefresh: () async {
              await init();
            },
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ..._meCard(),
                  ..._other(),
                ],
              ),
            )));
  }
}
