import 'package:drill_app/state/me.dart';
import 'package:drill_app/state/token_manager.dart';
import 'package:drill_app/view/token_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:logging/logging.dart';

class Bootstrap {
  final log = Logger('HttpService');

  Bootstrap() {
    init();
  }

  void init() async {
    log.finest("init start");
    initLogging();
    initState();
    log.finest("init end");
  }

  void initLogging() {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((record) {
      print(
          '${record.loggerName} ${record.level.name}: ${record.time}: ${record.message}');
    });
  }

  Future<void> initState() async {
    final meController = MeController();
    meController.init();
    GetIt.I.registerSingleton(meController);
    GetIt.I.registerSingleton(TokenController());
  }
}
