import 'package:logging/logging.dart';

import '../model/group.dart';
import '../util/http/http.dart';

class GroupApi {
  final HttpService httpService;

  GroupApi({required this.httpService});

  final log = Logger('GroupApi');
  Future<OnlyId?> createGroup(CreateGroupReq input) async {
    try {
      final data = await httpService.post('/v1/group/create', input.toJson());
      return OnlyId.fromJson(data);
    } catch (e) {
      log.severe('createGroup ', e);
    }
    return null;
  }

  Future<GetGroupListResp?> getGroupList(GetGroupListReq input) async {
    try {
      final data = await httpService.post('/v1/group/list', input.toJson());
      return GetGroupListResp.fromJson(data);
    } catch (e) {
      log.severe('getGroupList ', e);
    }
    return null;
  }

  Future<OnlyId?> createGroupInvite(CreateGroupInviteReq input) async {
    try {
      final data =
          await httpService.post('/v1/group_invite/create', input.toJson());
      return OnlyId.fromJson(data);
    } catch (e) {
      log.severe('createGroupInvite ', e);
    }
    return null;
  }

  Future<GetGroupInviteListResp?> getGroupInviteList(
      GetGroupInviteListReq input) async {
    try {
      final data =
          await httpService.post('/v1/group_invite/list', input.toJson());
      return GetGroupInviteListResp.fromJson(data);
    } catch (e) {
      log.severe('getGroupInviteList ', e);
    }
    return null;
  }

  Future<Base?> updateGroupInviteStatus(
      UpdateGroupInviteStatusReq input) async {
    try {
      final data = await httpService.post(
          '/v1/group_invite/update/status', input.toJson());
      return Base.fromJson(data);
    } catch (e) {
      log.severe('updateGroupInviteStatus ', e);
    }
    return null;
  }

  Future<GetGroupUserListResp?> getGroupUserList(
      GetGroupUserListReq input) async {
    try {
      final data =
          await httpService.post('/v1/group_user/list', input.toJson());
      return GetGroupUserListResp.fromJson(data);
    } catch (e) {
      log.severe('getGroupUserList ', e);
    }
    return null;
  }
}
