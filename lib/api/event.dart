import '../model/event.dart';
import '../util/http/http.dart';

class EventApi {
  final HttpService httpService;
  final String baseUrl;

  EventApi({required this.httpService, required this.baseUrl});
  Future<OnlyId?> createEvent(CreateEventReq input) async {
    final data =
        await httpService.post('$baseUrl/v1/event/create', input.toJson());
    return OnlyId.fromJson(data);
  }

  Future<GetEventListResp?> getEventList(GetEventListReq input) async {
    final data =
        await httpService.post('$baseUrl/v1/event/list', input.toJson());
    return GetEventListResp.fromJson(data);
  }

  Future<GetEventUserListResp?> getEventUserList(
      GetEventUserListReq input) async {
    final data =
        await httpService.post('$baseUrl/v1/event_user/list', input.toJson());
    return GetEventUserListResp.fromJson(data);
  }

  Future<Base?> updateEventUserStatus(UpdateEventUserStatusReq input) async {
    final data = await httpService.post(
        '$baseUrl/v1/event_user/update/status', input.toJson());
    return Base.fromJson(data);
  }
}
