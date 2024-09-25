import 'package:drill_app/api/api.dart';
import 'package:drill_app/constant/design.dart';
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
    LoginResp? loginResp =
        await api.userApi.userLogin(_loginReq).catchError((err) {
      log.severe('api.userApi.login: $err');
      return null;
    });
    if (loginResp?.base?.code == 0) {
      if (loginResp?.data?.token != null) {
        await _secureStorage.write(
            key: constant.token, value: loginResp?.data?.token);
        if (mounted) {
          Navigator.pushReplacementNamed(context, landing);
        }
      }
    }
  }

  Widget _loginForm() {
    return Column(
      children: [
        TextField(
          controller: TextEditingController(text: _loginReq.username),
          onChanged: (value) => _updateLoginReq(value, LoginReqField.username),
          decoration: const InputDecoration(
            hintText: "Username",
          ),
        ),
        const SizedBox(height: defaultPadding),
        TextField(
          controller: TextEditingController(text: _loginReq.password),
          onChanged: (value) => _updateLoginReq(value, LoginReqField.password),
          obscureText: true,
          decoration: const InputDecoration(
            hintText: "Password",
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/logo.png",
                width: 150, // 设置图片宽度
                height: 150, // 设置图片高度
              ),
              Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome back!",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: defaultPadding / 2),
                    const Text(
                      "Log in with your data that you intered during your registration.",
                    ),
                    const SizedBox(height: defaultPadding),
                    _loginForm(),
                    // Align(
                    //   child: TextButton(
                    //     child: const Text("Forgot password"),
                    //     onPressed: () {
                    //       Navigator.pushNamed(
                    //           context, passwordRecoveryScreenRoute);
                    //     },
                    //   ),
                    // ),
                    SizedBox(
                      height: size.height > 700
                          ? size.height * 0.1
                          : defaultPadding,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _userLoginFunc();
                      },
                      child: const Text("Log in"),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account?"),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, register);
                          },
                          child: const Text("Sign up"),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
