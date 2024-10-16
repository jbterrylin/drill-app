import 'package:logging/logging.dart';

import '../model/user.dart';
import '../util/http/http.dart';

class UserApi {
  final HttpService httpService;

  UserApi({required this.httpService});

  final log = Logger('UserApi');
  Future<CreateUserResp?> createUser(CreateUserReq input) async {
    try {
      final data = await httpService.post('/v1/user/create', input.toJson());
      return CreateUserResp.fromJson(data);
    } catch (e) {
      log.severe('createUser ', e);
    }
    return null;
  }

  Future<LoginResp?> userLogin(LoginReq input) async {
    try {
      final data = await httpService.post('/v1/user/login', input.toJson());
      return LoginResp.fromJson(data);
    } catch (e) {
      log.severe('userLogin ', e);
    }
    return null;
  }

  Future<Base?> userLogout() async {
    try {
      final data =
          await httpService.post('/v1/user/logout', <String, dynamic>{});
      return Base.fromJson(data);
    } catch (e) {
      log.severe('userLogout ', e);
    }
    return null;
  }

  Future<UserResp?> getMe() async {
    try {
      final data = await httpService.post('/v1/user/me', <String, dynamic>{});
      return UserResp.fromJson(data);
    } catch (e) {
      log.severe('getMe ', e);
    }
    return null;
  }
}
