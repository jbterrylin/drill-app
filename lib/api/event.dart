import 'package:drill_app/util/snack_bar/api_error.dart';
import 'package:logging/logging.dart';

import '../model/event.dart';
import '../util/http/http.dart';

class EventApi {
  final HttpService httpService;

  EventApi({required this.httpService});

  final log = Logger('EventApi');
  Future<OnlyId?> createEvent(CreateEventReq input) async {
    Map<String, dynamic> data = {};
    try {
      data = await httpService.post('/v1/event/create', input.toJson());
      return OnlyId.fromJson(data);
    } catch (e) {
      log.severe('createEvent ', e);
      snackBarApiError(data["msg"] ?? "server error");
    }
    return null;
  }

  Future<GetEventListResp?> getEventList(GetEventListReq input) async {
    Map<String, dynamic> data = {};
    try {
      data = await httpService.post('/v1/event/list', input.toJson());
      return GetEventListResp.fromJson(data);
    } catch (e) {
      log.severe('getEventList ', e);
      snackBarApiError(data["msg"] ?? "server error");
    }
    return null;
  }

  Future<GetEventUserListResp?> getEventUserList(
      GetEventUserListReq input) async {
    Map<String, dynamic> data = {};
    try {
      data = await httpService.post('/v1/event_user/list', input.toJson());
      return GetEventUserListResp.fromJson(data);
    } catch (e) {
      log.severe('getEventUserList ', e);
      snackBarApiError(data["msg"] ?? "server error");
    }
    return null;
  }

  Future<Base?> updateEventUserStatus(UpdateEventUserStatusReq input) async {
    Map<String, dynamic> data = {};
    try {
      data = await httpService.post(
          '/v1/event_user/update/status', input.toJson());
      return Base.fromJson(data);
    } catch (e) {
      log.severe('updateEventUserStatus ', e);
      snackBarApiError(data["msg"] ?? "server error");
    }
    return null;
  }
}
