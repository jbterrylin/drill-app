import '../model/group.dart';
import '../util/http/http.dart';

class GroupApi {
  final HttpService httpService;

  GroupApi({required this.httpService});
  Future<OnlyId?> createGroup(CreateGroupReq input) async {
    final data = await httpService.post('/v1/group/create', input.toJson());
    return OnlyId.fromJson(data);
  }

  Future<GetGroupListResp?> getGroupList(GetGroupListReq input) async {
    final data = await httpService.post('/v1/group/list', input.toJson());
    return GetGroupListResp.fromJson(data);
  }

  Future<OnlyId?> createGroupInvite(CreateGroupInviteReq input) async {
    final data =
        await httpService.post('/v1/group_invite/create', input.toJson());
    return OnlyId.fromJson(data);
  }

  Future<GetGroupInviteListResp?> getGroupInviteList(
      GetGroupInviteListReq input) async {
    final data =
        await httpService.post('/v1/group_invite/list', input.toJson());
    return GetGroupInviteListResp.fromJson(data);
  }

  Future<Base?> updateGroupInviteStatus(
      UpdateGroupInviteStatusReq input) async {
    final data = await httpService.post(
        '/v1/group_invite/update/status', input.toJson());
    return Base.fromJson(data);
  }

  Future<GetGroupUserListResp?> getGroupUserList(
      GetGroupUserListReq input) async {
    final data = await httpService.post('/v1/group_user/list', input.toJson());
    return GetGroupUserListResp.fromJson(data);
  }
}
