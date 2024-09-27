import 'package:drill_app/api/api.dart';
import 'package:drill_app/component/bottom_bar.dart';
import 'package:drill_app/constant/router.dart';
import 'package:drill_app/model/group.dart';
import 'package:drill_app/state/token_manager.dart';
import 'package:drill_app/util/secure_storage/secure_storage.dart';
import 'package:flutter/material.dart';

class TokenManager extends StatefulWidget {
  const TokenManager({super.key});

  @override
  State<TokenManager> createState() => _TokenManagerState();
}

class _TokenManagerState extends State<TokenManager> {
  TokenController tokenController = TokenController();

  late List<TokenInfo> tokens;

  void _updateToken(String input, int index, TokenInfoField field) {
    switch (field) {
      case TokenInfoField.name:
        tokens[index].name = input;
        break;
      case TokenInfoField.userId:
        tokens[index].userId = input;
        break;
      case TokenInfoField.token:
        tokens[index].token = input;
        break;
    }
  }

  void _resetToken() async {
    tokens = await tokenController.getToken();

    setState(() {
      tokens;
    });
  }

  _TokenManagerState() {
    init();
  }

  void init() async {
    tokens = await tokenController.getToken();
  }

  Widget _tokenInput() {
    return Column(
      children: tokens
          .asMap()
          .map((i, element) => MapEntry(
              i,
              Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(
                      width: 250,
                      child: TextField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Username',
                        ),
                        controller: TextEditingController(text: tokens[i].name),
                        onChanged: (value) =>
                            _updateToken(value, i, TokenInfoField.name),
                      ),
                    ),
                    SizedBox(
                      width: 250,
                      child: TextField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Username',
                        ),
                        controller:
                            TextEditingController(text: tokens[i].userId),
                        onChanged: (value) =>
                            _updateToken(value, i, TokenInfoField.userId),
                      ),
                    ),
                    SizedBox(
                      width: 250,
                      child: TextField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Username',
                        ),
                        controller:
                            TextEditingController(text: tokens[i].token),
                        onChanged: (value) =>
                            _updateToken(value, i, TokenInfoField.token),
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        tokenController.setTokenToCurrent(tokens, i);
                        if (mounted) {
                          Navigator.pushReplacementNamed(context, landing);
                        }
                      },
                      child: const Text("Set to current"),
                    ),
                  ],
                ),
              )))
          .values
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomBar(
        title: "Home",
        selectedIndex: BottomBarIndex.home,
        body: Center(
          child: Column(
            children: <Widget>[
              const Text("Group near you"),
              _tokenInput(),
              TextButton(
                onPressed: () {
                  tokenController.setToken(tokens);
                },
                child: const Text("Save"),
              ),
              TextButton(
                onPressed: () {
                  _resetToken();
                },
                child: const Text("Reset"),
              ),
            ],
          ),
        ));
  }
}
