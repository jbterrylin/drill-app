import 'dart:convert';

import 'package:drill_app/api/api.dart';
import 'package:drill_app/constant/constant.dart' as constant;
import 'package:drill_app/constant/router.dart';
import 'package:drill_app/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Landing extends StatefulWidget { 
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    init();  // 在 initState 中调用异步初始化方法
  }

  Future<UserResp?> getMeFunc() async {
     UserResp? userResp = await api.userApi.getMe();
    if (userResp?.base?.code == 0) {
      await _secureStorage.write(key: constant.userInfo, value: jsonEncode(userResp?.toJson()));
      await _secureStorage.write(key: constant.userInfoReceiveTime, value: DateTime.now().toIso8601String());
    }
    return userResp;
  }

  Future<void> init() async {
    String? token = await _secureStorage.read(key: constant.token);
        
    if (token == null) {
      // 如果没有 token，跳转到登录页面
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, login);
    } else {
     var userResp = await getMeFunc();
      if (!mounted) return;
      if (userResp?.base?.code == 0) {
        Navigator.pushReplacementNamed(context, home);
      } else {
        Navigator.pushReplacementNamed(context, login);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),  // 加载过程中显示的内容
      ),
    );
  }
}
