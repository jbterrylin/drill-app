import 'package:drill_app/api/api.dart';
import 'package:drill_app/constant/router.dart';
import 'package:drill_app/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logging/logging.dart';
import 'package:drill_app/constant/constant.dart' as constant;

class UiLogin extends StatefulWidget {
  const UiLogin({super.key});

  @override
  State<UiLogin> createState() => _UiLoginState();
}

class _UiLoginState extends State<UiLogin> {
  final log = Logger('UiLogin');
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  final LoginReq _loginReq = LoginReq();

  void _updateLoginReq(String input, LoginReqField field) {
    switch (field) {
      case LoginReqField.username:
        _loginReq.username = input;
        break;
      case LoginReqField.password:
        _loginReq.password = input;
        break;
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
            controller: TextEditingController(text: _loginReq.username),
            onChanged: (value) =>
                _updateLoginReq(value, LoginReqField.username),
          ),
        ),
        const SizedBox(height: 10),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // 添加 logo.png 图片
            Image.asset(
              'assets/images/logo.png', // 确保你的 logo 图片路径正确
              width: 150, // 设置图片宽度
              height: 150, // 设置图片高度
            ),
            const SizedBox(height: 20), // 添加一个空白区分 logo 和表单
            // 这里是登录表单
            loginForm(),
            const SizedBox(height: 20), // 添加一个空白区分表单和按钮
            // 登录按钮
            TextButton(
              onPressed: () {
                _userLoginFunc();
              },
              child: const Text(
                "Login",
                style: TextStyle(fontSize: 18), // 设置按钮文字大小
              ),
            ),
            // 注册按钮
            TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, register);
              },
              child: const Text(
                "Sign up",
                style: TextStyle(fontSize: 18), // 设置按钮文字大小
              ),
            ),
          ],
        ),
      ),
    );
  }
}
