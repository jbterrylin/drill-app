import '../model/user.dart';
import '../util/http/http.dart';

class UserApi {
  final HttpService httpService;
  final String baseUrl;

  UserApi({required this.httpService, required this.baseUrl});
  Future<CreateUserResp?> createUser(CreateUserReq input) async {
    final data =
        await httpService.post('$baseUrl/v1/user/create', input.toJson());
    return CreateUserResp.fromJson(data);
  }

  Future<LoginResp?> userLogin(LoginReq input) async {
    final data =
        await httpService.post('$baseUrl/v1/user/login', input.toJson());
    return LoginResp.fromJson(data);
  }

  Future<Base?> userLogout() async {
    final data =
        await httpService.post('$baseUrl/v1/user/logout', <String, dynamic>{});
    return Base.fromJson(data);
  }

  Future<UserResp?> getMe() async {
    final data =
        await httpService.post('$baseUrl/v1/user/me', <String, dynamic>{});
    return UserResp.fromJson(data);
  }
}
