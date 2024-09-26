import 'package:logging/logging.dart';

class Bootstrap {
  final log = Logger('HttpService');

  Bootstrap() {
    init();
  }

  void init() async {
    log.finest("init start");
    initLogging();
    log.finest("init end");
  }

  void initLogging() {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((record) {
      print('${record.loggerName} ${record.level.name}: ${record.time}: ${record.message}');
    });
  }
}
