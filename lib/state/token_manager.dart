import 'dart:convert';

import 'package:drill_app/constant/constant.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logging/logging.dart';
import 'package:drill_app/constant/constant.dart' as constant;

enum TokenInfoField {
  name,
  userId,
  token,
}

class TokenInfo {
  String name = "";
  String userId = "0";
  String token = "";

  TokenInfo({required this.name, required this.userId, required this.token});

  factory TokenInfo.fromJson(Map<String, dynamic> json) {
    return TokenInfo(
      name: json['name'],
      userId: json['userId'],
      token: json['token'],
    );
  }

  // 将 TokenInfo 对象转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'userId': userId,
      'token': token,
    };
  }
}

class TokenController {
  final log = Logger('TokenController');

  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  TokenController() {
    init();
  }

  void init() async {
    await getToken();
  }

  Future<List<TokenInfo>> getToken() async {
    var devTokensStr = await _secureStorage.read(key: devTokens);
    if (devTokensStr != null) {
      return (jsonDecode(devTokensStr) as List)
          .map((v) => TokenInfo.fromJson(v))
          .toList();
    }

    return [];
  }

  Future<void> setToken(List<TokenInfo> tokens) async {
    await _secureStorage.write(
        key: devTokens,
        value: jsonEncode(tokens.map((token) => token.toJson()).toList()));
  }

  Future<void> setTokenToCurrent(List<TokenInfo> tokens, int index) async {
    await _secureStorage.write(key: constant.token, value: tokens[index].token);
  }
}

TokenController tokenController = TokenController();
