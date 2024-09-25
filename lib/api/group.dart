import 'package:drill_app/util/http/resp_handler.dart';
import 'package:logging/logging.dart';

import '../model/group.dart';
import '../util/http/http.dart';

class GroupApi {
    final HttpService httpService;

    GroupApi({required this.httpService});

    final log = Logger('GroupApi');
    Future<OnlyId?> createGroup(CreateGroupReq input) async {
        return respHandler(
            httpService,
            '/v1/group/create',
            input.toJson(),
            OnlyId.fromJson,
            log,
        );
    }
    
    Future<GetGroupListResp?> getGroupList(GetGroupListReq input) async {
        return respHandler(
            httpService,
            '/v1/group/list',
            input.toJson(),
            GetGroupListResp.fromJson,
            log,
        );
    }
    
    Future<OnlyId?> createGroupInvite(CreateGroupInviteReq input) async {
        return respHandler(
            httpService,
            '/v1/group_invite/create',
            input.toJson(),
            OnlyId.fromJson,
            log,
        );
    }
    
    Future<GetGroupInviteListResp?> getGroupInviteList(GetGroupInviteListReq input) async {
        return respHandler(
            httpService,
            '/v1/group_invite/list',
            input.toJson(),
            GetGroupInviteListResp.fromJson,
            log,
        );
    }
    
    Future<Base?> updateGroupInviteStatus(UpdateGroupInviteStatusReq input) async {
        return respHandler(
            httpService,
            '/v1/group_invite/update/status',
            input.toJson(),
            Base.fromJson,
            log,
        );
    }
    
    Future<GetGroupUserListResp?> getGroupUserList(GetGroupUserListReq input) async {
        return respHandler(
            httpService,
            '/v1/group_user/list',
            input.toJson(),
            GetGroupUserListResp.fromJson,
            log,
        );
    }
    
}
