import 'package:drill_app/api/user.dart';
import 'package:drill_app/util/http/http.dart';

class Api {
  late UserApi userApi;

  Api() {
    init();
  }

  void init() async {
    userApi = UserApi(httpService: HttpService(baseUrl: 'localhost:3000'));
  }
}

Api api = Api();