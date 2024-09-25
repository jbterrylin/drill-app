import 'package:drill_app/util/snack_bar/api_error.dart';
import 'package:logging/logging.dart';

import '../model/user.dart';
import '../util/http/http.dart';

class UserApi {
  final HttpService httpService;

  UserApi({required this.httpService});

  final log = Logger('UserApi');
  Future<CreateUserResp?> createUser(CreateUserReq input) async {
    Map<String, dynamic> data = {};
    try {
      data = await httpService.post('/v1/user/create', input.toJson());
      if (data["msg"] != null && data["msg"] != "") {
        snackBarApiError(data["msg"] ?? "error");
      }
      return CreateUserResp.fromJson(data);
    } catch (e) {
      log.severe('createUser ', e);
      snackBarApiError(data["msg"] ?? "server error");
    }
    return null;
  }

  Future<LoginResp?> userLogin(LoginReq input) async {
    Map<String, dynamic> data = {};
    try {
      data = await httpService.post('/v1/user/login', input.toJson());
      if (data["msg"] != null && data["msg"] != "") {
        snackBarApiError(data["msg"] ?? "error");
      }
      return LoginResp.fromJson(data);
    } catch (e) {
      log.severe('userLogin ', e);
      snackBarApiError(data["msg"] ?? "server error");
    }
    return null;
  }

  Future<Base?> userLogout() async {
    Map<String, dynamic> data = {};
    try {
      data = await httpService.post('/v1/user/logout', <String, dynamic>{});
      if (data["msg"] != null && data["msg"] != "") {
        snackBarApiError(data["msg"] ?? "error");
      }
      return Base.fromJson(data);
    } catch (e) {
      log.severe('userLogout ', e);
      snackBarApiError(data["msg"] ?? "server error");
    }
    return null;
  }

  Future<UserResp?> getMe() async {
    Map<String, dynamic> data = {};
    try {
      data = await httpService.post('/v1/user/me', <String, dynamic>{});
      if (data["msg"] != null && data["msg"] != "") {
        snackBarApiError(data["msg"] ?? "error");
      }
      return UserResp.fromJson(data);
    } catch (e) {
      log.severe('getMe ', e);
      snackBarApiError(data["msg"] ?? "server error");
    }
    return null;
  }
}
