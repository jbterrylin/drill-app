import 'package:drill_app/api/group.dart';
import 'package:drill_app/api/user.dart';
import 'package:drill_app/util/http/http.dart';

class Api {
  late UserApi userApi;
  late GroupApi groupApi;

  Api() {
    init();
  }

  void init() async {
    userApi = UserApi(httpService: HttpService(baseUrl: 'http://10.0.2.2:3000'));
    groupApi = GroupApi(httpService: HttpService(baseUrl: 'http://10.0.2.2:3001'));
  }
}

Api api = Api();