import 'dart:convert';
import 'package:drill_app/model/group.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:drill_app/constant/constant.dart' as constant;
import 'package:logging/logging.dart';

Future<int?> getUserId() async {
    const FlutterSecureStorage secureStorage = FlutterSecureStorage();

    var userInfo = await secureStorage.read(key: constant.userInfo);
    if (userInfo != null) {
      return User.fromJson(jsonDecode(userInfo)).id;
    }
  return 1;
}