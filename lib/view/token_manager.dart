import 'package:drill_app/constant/router.dart';
import 'package:drill_app/state/token_manager.dart';
import 'package:drill_app/util/list/safe_delete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:drill_app/constant/constant.dart' as constant;
import 'package:flutter/services.dart';

class UiTokenManager extends StatefulWidget {
  const UiTokenManager({super.key});

  @override
  State<UiTokenManager> createState() => _UiTokenManagerState();
}

class _UiTokenManagerState extends State<UiTokenManager> {
  TokenController tokenController = TokenController();

  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  late List<TokenInfo> tokens = [];

  String? currentToken;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    await _resetToken();
    currentToken = await _secureStorage.read(key: constant.token);
  }

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

  Future<void> _resetToken() async {
    tokens = await tokenController.getToken();

    setState(() {
      tokens;
    });
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
                          labelText: 'Name',
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
                          labelText: 'UserId',
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
                          labelText: 'Token',
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
                    TextButton(
                      onPressed: () async {
                        safeDeleteByIndex(tokens, i);
                        await tokenController.setToken(tokens);
                        _resetToken();
                      },
                      child: const Text("Delete"),
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
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: <Widget>[
            _tokenInput(),
            TextButton(
              onPressed: () {
                tokens.add(TokenInfo(name: '', userId: '', token: ''));
                setState(() {
                  tokens;
                });
              },
              child: const Text("Add"),
            ),
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
            TextButton(
              onPressed: () {
                Clipboard.setData(ClipboardData(text: currentToken ?? ""));
                // 显示 SnackBar 提示用户内容已复制
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Copied to clipboard!")),
                );
              },
              child: Text('Current Token ${currentToken ?? ""}'),
            ),
          ],
        ),
      ),
    );
  }
}
