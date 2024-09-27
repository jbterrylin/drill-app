import 'package:drill_app/api/api.dart';
import 'package:drill_app/model/user.dart';
import 'package:logging/logging.dart';

class MeController {
  final log = Logger('MeController');

  User? _user;
  DateTime? userReceiveTime;

  MeController();

  Future<void> init() async {
    getMeWithRefresh();
  }

  User? getMe() {
      return _user;
  }

  Future<User?> getMeWithRefresh() async {
    UserResp? userResp = await api.userApi.getMe();
    if (userResp?.base?.code == 0) {
      _user = userResp?.data;
      userReceiveTime = DateTime.now();
    } else {
      _user = null;
    }
    return _user;
  }
}
