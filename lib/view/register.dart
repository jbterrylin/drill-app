import 'package:drill_app/api/api.dart';
import 'package:drill_app/constant/design.dart';
import 'package:drill_app/constant/router.dart';
import 'package:drill_app/model/user.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logging/logging.dart';
import 'package:drill_app/constant/constant.dart' as constant;

class UiRegister extends StatefulWidget {
  const UiRegister({super.key});

  @override
  State<UiRegister> createState() => _UiRegisterState();
}

class _UiRegisterState extends State<UiRegister> {
  final log = Logger('UiRegister');
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
    CreateUserResp? createUserResp =
        await api.userApi.createUser(_createUserReq).catchError((err) {
      log.severe('api.userApi.createUser: $err');
      return null;
    });
    if (createUserResp?.base?.code == 0) {
      if (createUserResp?.data?.token != null) {
        await _secureStorage.write(
            key: constant.token, value: createUserResp?.data?.token);
        if (mounted) {
          Navigator.pushReplacementNamed(context, landing);
        }
      }
    }
  }

  Widget _registerForm() {
    return Column(
      children: [
        TextField(
          controller: TextEditingController(text: _createUserReq.username),
          onChanged: (value) =>
              _updateLoginReq(value, CreateUserReqField.username),
          decoration: const InputDecoration(
            hintText: "Username",
          ),
        ),
        const SizedBox(height: defaultPadding),
        TextField(
          controller: TextEditingController(text: _createUserReq.password),
          onChanged: (value) =>
              _updateLoginReq(value, CreateUserReqField.password),
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
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
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
                      "Let’s get started!",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: defaultPadding / 2),
                    const Text(
                      "Please enter your data in order to create an account.",
                    ),
                    const SizedBox(height: defaultPadding),
                    _registerForm(),
                    const SizedBox(height: defaultPadding),
                    Row(
                      children: [
                        Checkbox(
                          onChanged: (value) {},
                          value: false,
                        ),
                        Expanded(
                          child: Text.rich(
                            TextSpan(
                              text: "I agree with the",
                              children: [
                                TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {},
                                  text: " Terms of service ",
                                  style: const TextStyle(
                                    color: primaryColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const TextSpan(
                                  text: "& privacy policy.",
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: defaultPadding * 2),
                    ElevatedButton(
                      onPressed: () {
                        _createUserFunc();
                      },
                      child: const Text("Register"),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Do you have an account?"),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, login);
                          },
                          child: const Text("Log in"),
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
