import 'dart:convert';
import 'package:drill_app/constant/router.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:drill_app/constant/constant.dart' as constant;
import 'package:logging/logging.dart';

class HttpService {
  final String baseUrl;

  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  final log = Logger('HttpService');

  HttpService({required this.baseUrl});

  // 拦截器：在请求前进行处理（例如添加认证 token 等）
  Future<Map<String, String>> _addInterceptors() async {
    String? token = await _secureStorage.read(key: constant.token);

    return {
      'Content-Type': 'application/json',
      'Authorization': token ?? '',
    };
  }

  Future<Map<String, dynamic>> get(String endpoint) async {
    final headers = await _addInterceptors();
    final response =
        await http.get(Uri.parse('$baseUrl$endpoint'), headers: headers);

    return _handleResponse(response, "");
  }

  Future<Map<String, dynamic>> post(
      String endpoint, Map<String, dynamic> data) async {
    final headers = await _addInterceptors();
    final response = await http.post(
      Uri.parse('$baseUrl$endpoint'),
      headers: headers,
      body: jsonEncode(data),
    );

    return _handleResponse(response, jsonEncode(data));
  }

  Future<Map<String, dynamic>> _handleResponse(http.Response response, String? body) async {
    log.severe('${response.request?.url.toString()} $body (${response.statusCode}): ${response.body}');
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else if (response.statusCode == 401) {
      await _secureStorage.delete(key: constant.token);
      navigatorKey.currentState?.pushReplacementNamed(login);
    } {
      throw Exception('Request ${response.request?.url.toString()} fail');
    }
  }
}
