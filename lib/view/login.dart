import 'package:drill_app/api/api.dart';
import 'package:drill_app/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logging/logging.dart';
import 'package:drill_app/constant/constant.dart' as constant;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final log = Logger('Login');
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  final LoginReq _loginReq = LoginReq();

  void _updateLoginReq(String input, LoginReqField field) {
    switch (field) {
      case LoginReqField.username:
        _loginReq.username = input;
      case LoginReqField.password:
        _loginReq.password = input;
    }
  }

  void _userLoginFunc() async {
    LoginResp? loginResp = await api.userApi.userLogin(_loginReq).catchError((err) {
      log.severe('api.userApi.login: $err');
      return null;
    });
    if (loginResp?.base?.code == 0) {
      if (loginResp?.data?.token != null) {
        await _secureStorage.write(key: constant.token, value: loginResp?.data?.token);
        if (mounted) {
          Navigator.pushReplacementNamed(context, '/landing');
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
            controller: TextEditingController(text: _loginReq.username),
            onChanged: (value) =>
                _updateLoginReq(value, LoginReqField.username),
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
            controller: TextEditingController(text: _loginReq.password),
            onChanged: (value) =>
                _updateLoginReq(value, LoginReqField.password),
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
        title: const Text("Login"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            loginForm(),
            TextButton(
              onPressed: () {
                _userLoginFunc();
              },
              child: const Text("Login"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/register');
              },
              child: const Text("Sign up"),
            ),
          ],
        ),
      ),
    );
  }
}
