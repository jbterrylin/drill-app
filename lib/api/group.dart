import 'package:drill_app/util/snack_bar/api_error.dart';
import 'package:logging/logging.dart';

import '../model/group.dart';
import '../util/http/http.dart';

class GroupApi {
  final HttpService httpService;

  GroupApi({required this.httpService});

  final log = Logger('GroupApi');
  Future<OnlyId?> createGroup(CreateGroupReq input) async {
    Map<String, dynamic> data = {};
    try {
      data = await httpService.post('/v1/group/create', input.toJson());
      if (data["msg"] != null && data["msg"] != "") {
        snackBarApiError(data["msg"] ?? "error");
      }
      return OnlyId.fromJson(data);
    } catch (e) {
      log.severe('createGroup ', e);
      snackBarApiError(data["msg"] ?? "server error");
    }
    return null;
  }

  Future<GetGroupListResp?> getGroupList(GetGroupListReq input) async {
    Map<String, dynamic> data = {};
    try {
      data = await httpService.post('/v1/group/list', input.toJson());
      if (data["msg"] != null && data["msg"] != "") {
        snackBarApiError(data["msg"] ?? "error");
      }
      return GetGroupListResp.fromJson(data);
    } catch (e) {
      log.severe('getGroupList ', e);
      snackBarApiError(data["msg"] ?? "server error");
    }
    return null;
  }

  Future<OnlyId?> createGroupInvite(CreateGroupInviteReq input) async {
    Map<String, dynamic> data = {};
    try {
      data = await httpService.post('/v1/group_invite/create', input.toJson());
      if (data["msg"] != null && data["msg"] != "") {
        snackBarApiError(data["msg"] ?? "error");
      }
      return OnlyId.fromJson(data);
    } catch (e) {
      log.severe('createGroupInvite ', e);
      snackBarApiError(data["msg"] ?? "server error");
    }
    return null;
  }

  Future<GetGroupInviteListResp?> getGroupInviteList(
      GetGroupInviteListReq input) async {
    Map<String, dynamic> data = {};
    try {
      data = await httpService.post('/v1/group_invite/list', input.toJson());
      if (data["msg"] != null && data["msg"] != "") {
        snackBarApiError(data["msg"] ?? "error");
      }
      return GetGroupInviteListResp.fromJson(data);
    } catch (e) {
      log.severe('getGroupInviteList ', e);
      snackBarApiError(data["msg"] ?? "server error");
    }
    return null;
  }

  Future<Base?> updateGroupInviteStatus(
      UpdateGroupInviteStatusReq input) async {
    Map<String, dynamic> data = {};
    try {
      data = await httpService.post(
          '/v1/group_invite/update/status', input.toJson());
      if (data["msg"] != null && data["msg"] != "") {
        snackBarApiError(data["msg"] ?? "error");
      }
      return Base.fromJson(data);
    } catch (e) {
      log.severe('updateGroupInviteStatus ', e);
      snackBarApiError(data["msg"] ?? "server error");
    }
    return null;
  }

  Future<GetGroupUserListResp?> getGroupUserList(
      GetGroupUserListReq input) async {
    Map<String, dynamic> data = {};
    try {
      data = await httpService.post('/v1/group_user/list', input.toJson());
      if (data["msg"] != null && data["msg"] != "") {
        snackBarApiError(data["msg"] ?? "error");
      }
      return GetGroupUserListResp.fromJson(data);
    } catch (e) {
      log.severe('getGroupUserList ', e);
      snackBarApiError(data["msg"] ?? "server error");
    }
    return null;
  }
}
