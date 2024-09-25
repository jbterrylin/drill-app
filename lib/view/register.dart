import 'package:drill_app/api/api.dart';
import 'package:drill_app/constant/router.dart';
import 'package:drill_app/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logging/logging.dart';
import 'package:drill_app/constant/constant.dart' as constant;

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final log = Logger('Register');
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  final CreateUserReq _createUserReq = CreateUserReq();

  void _updateLoginReq(String input, CreateUserReqField field) {
    switch (field) {
      case CreateUserReqField.username:
        _createUserReq.username = input;
        break;
      case CreateUserReqField.password:
        _createUserReq.password = input;
        break;
    }
  }

  void _createUserFunc() async {
    CreateUserResp? createUserResp = await api.userApi.createUser(_createUserReq).catchError((err) {
      log.severe('api.userApi.createUser: $err');
      return null;
    });
    if (createUserResp?.base?.code == 0) {
      if (createUserResp?.data?.token != null) {
        await _secureStorage.write(key: constant.token, value: createUserResp?.data?.token);
        if (mounted) {
          Navigator.pushReplacementNamed(context, landing);
        }
      }
    }
  }

  Widget loginForm() {
    return Column(
      children: <Widget>[
        SizedBox(
          width: 250,
          child: TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Username',
            ),
            controller: TextEditingController(text: _createUserReq.username),
            onChanged: (value) =>
                _updateLoginReq(value, CreateUserReqField.username),
          ),
        ),
        SizedBox(
          width: 250,
          child: TextField(
            obscureText: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
            ),
            controller: TextEditingController(text: _createUserReq.password),
            onChanged: (value) =>
                _updateLoginReq(value, CreateUserReqField.password),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Register"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            loginForm(),
            TextButton(
              onPressed: () {
                _createUserFunc();
              },
              child: const Text("Register"),
            ),
          ],
        ),
      ),
    );
  }
}
