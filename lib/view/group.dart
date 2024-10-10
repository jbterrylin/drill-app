import 'package:drill_app/api/api.dart';
import 'package:drill_app/model/group.dart';
import 'package:drill_app/model/group_enum.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

const groupInitFieldGroupId = "groupId";

class UiGroup extends StatefulWidget {
  const UiGroup({super.key, required this.groupId});

  final int groupId;

  @override
  State<UiGroup> createState() => _UiGroupState();
}

class _UiGroupState extends State<UiGroup> {
  final log = Logger('UiGroup');

  Group? _group;

  bool _isGroupInviteListEnd = false;
  int _groupInviteListPage = 1;
  final List<GroupInvite> _groupInviteList = [];

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    await _getGroupListFunc();
    _getGroupInviteListFunc();
  }

   Future<void> _getGroupListFunc() async {
    GetGroupListReq getGroupListReq = GetGroupListReq(
      baseListReq: BaseListReq(page: 1, pageSize: 1),
      id: widget.groupId,
    );
    GetGroupListResp? getGroupListResp = await api.groupApi
        .getGroupList(getGroupListReq)
        .catchError((err) {
      log.severe('api.groupApi.getGroupList: $err');
      return null;
    });
    if (getGroupListResp?.data.data.isNotEmpty ?? false) {
      _group = getGroupListResp?.data.data.first;
      setState(() {
        _group;
      });
    }
  }


  Future<void> _getGroupInviteListFunc() async {
    if (_isGroupInviteListEnd) {
      return;
    }
    GetGroupInviteListReq getGroupInviteListReq = GetGroupInviteListReq(
      baseListReq: BaseListReq(page: _groupInviteListPage, pageSize: 10),
    );
    GetGroupInviteListResp? getGroupInviteListResp = await api.groupApi
        .getGroupInviteList(getGroupInviteListReq)
        .catchError((err) {
      log.severe('api.groupApi.getGroupInviteList: $err');
      return null;
    });
    _groupInviteListPage += 1;
    if (getGroupInviteListResp?.data.data.isNotEmpty ?? false) {
      _groupInviteList.addAll(getGroupInviteListResp?.data.data ?? []);
      setState(() {
        _groupInviteList;
      });
    } else {
      _isGroupInviteListEnd = true;
    }
  }

  Future<void> _updateGroupInviteStatusFunc(GroupInviteStatus status) async {
    UpdateGroupInviteStatusReq updateGroupInviteStatusReq =
        UpdateGroupInviteStatusReq(groupId: widget.groupId, status: status.value);
    Base? updateGroupInviteStatusResp = await api.groupApi
        .updateGroupInviteStatus(updateGroupInviteStatusReq)
        .catchError((err) {
      log.severe('api.groupApi.updateGroupInviteStatus: $err');
      return null;
    });
    if (updateGroupInviteStatusResp?.code == 0) {
      _getGroupInviteListFunc();
    }
  }

  String _inviteInfo(GroupInvite groupInvite) {
    if (groupInvite.inviteUserId == groupInvite.invitedBy) {
      return "self_invite";
    }
    return groupInvite.invitedByUser != null ? 'invited_by${groupInvite.invitedByUser?.username}' : "";
  }


  Widget _groupInvites() {
    return Column(
      children: _groupInviteList
          .map((v) => {
                Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        leading: const Icon(Icons.album),
                        title: Text(v.inviteUser?.username ?? ""),
                        subtitle: Text(_inviteInfo(v)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          TextButton(
                            child: const Text('Accept'),
                            onPressed: () {
                              _updateGroupInviteStatusFunc(GroupInviteStatus.approve);
                            },
                          ),
                          TextButton(
                            child: const Text('Reject'),
                            onPressed: () {
                              _updateGroupInviteStatusFunc(GroupInviteStatus.reject);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              })
          .expand((v) => v)
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: RefreshIndicator(
          onRefresh: () async {
            await init();
          },
          child: Center(
            child: Column(
              children: <Widget>[
                Text('Group Detail ${widget.groupId}'),
                const Text("Group Invites"),
                _groupInvites(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
