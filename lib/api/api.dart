import 'package:drill_app/api/event.dart';
import 'package:drill_app/api/group.dart';
import 'package:drill_app/api/user.dart';
import 'package:drill_app/util/http/http.dart';

class Api {
  late UserApi userApi;
  late GroupApi groupApi;
  late EventApi eventApi;

  Api() {
    init();
  }

  void init() async {
    userApi = UserApi(httpService: HttpService(baseUrl: 'http://10.0.2.2:3000'));
    groupApi = GroupApi(httpService: HttpService(baseUrl: 'http://10.0.2.2:3001'));
    eventApi = EventApi(httpService: HttpService(baseUrl: 'http://10.0.2.2:3002'));
  }
}

Api api = Api();