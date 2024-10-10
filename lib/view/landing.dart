import 'package:drill_app/constant/constant.dart' as constant;
import 'package:drill_app/constant/router.dart';
import 'package:drill_app/state/me.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

class UiLanding extends StatefulWidget {
  const UiLanding({super.key});

  @override
  State<UiLanding> createState() => _UiLandingState();
}

class _UiLandingState extends State<UiLanding> {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    init(); // 在 initState 中调用异步初始化方法
  }

  Future<void> init() async {
    String? token = await _secureStorage.read(key: constant.token);

    if (token == null) {
      // 如果没有 token，跳转到登录页面
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, login);
    } else {
      var userResp = await GetIt.I<MeController>().getMeWithRefresh();
      if (!mounted) return;
      if (userResp != null) {
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
        child: CircularProgressIndicator(), // 加载过程中显示的内容
      ),
    );
  }
}
