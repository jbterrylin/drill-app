import 'package:drill_app/util/http/resp_handler.dart';
import 'package:logging/logging.dart';

import '../model/event.dart';
import '../util/http/http.dart';

class EventApi {
  final HttpService httpService;

  EventApi({required this.httpService});

  final log = Logger('EventApi');
  Future<OnlyId?> createEvent(CreateEventReq input) async {
    return respHandler(
      httpService,
      '/v1/event/create',
      input.toJson(),
      OnlyId.fromJson,
      log,
    );
  }

  Future<GetEventListResp?> getEventList(GetEventListReq input) async {
    return respHandler(
      httpService,
      '/v1/event/list',
      input.toJson(),
      GetEventListResp.fromJson,
      log,
    );
  }

  Future<GetEventListResp?> getMyEventList(GetEventListReq input) async {
    return respHandler(
      httpService,
      '/v1/event/list/my',
      input.toJson(),
      GetEventListResp.fromJson,
      log,
    );
  }

  Future<GetEventUserListResp?> getEventUserList(
      GetEventUserListReq input) async {
    return respHandler(
      httpService,
      '/v1/event_user/list',
      input.toJson(),
      GetEventUserListResp.fromJson,
      log,
    );
  }

  Future<Base?> updateEventUserStatus(UpdateEventUserStatusReq input) async {
    return respHandler(
      httpService,
      '/v1/event_user/update/status',
      input.toJson(),
      Base.fromJson,
      log,
    );
  }
}
