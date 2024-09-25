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

  Future<void> init() async {
    String? token = await _secureStorage.read(key: 'token');
    
    // 检查 State 是否仍然 mounted
    if (!mounted) return;
    
    if (token == null) {
      // 如果没有 token，跳转到登录页面
      Navigator.pushReplacementNamed(context, '/login');
    } else {
      // 如果有 token，跳转到首页
      Navigator.pushReplacementNamed(context, '/home');
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
