import 'package:drill_app/api/api.dart';
import 'package:drill_app/constant/router.dart';
import 'package:drill_app/model/event.dart' as eventModel;
import 'package:drill_app/model/group.dart';
import 'package:drill_app/model/group_enum.dart';
import 'package:drill_app/state/me.dart';
import 'package:drill_app/util/date.dart';
import 'package:drill_app/view/event.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:logging/logging.dart';

const uiGroupInitFieldGroupId = "groupId";

class UiGroup extends StatefulWidget {
  const UiGroup({super.key, required this.groupId});

  final int groupId;

  @override
  State<UiGroup> createState() => _UiGroupState();
}

class _UiGroupState extends State<UiGroup> {
  final log = Logger('UiGroup');

  bool _isOwner = false;

  Group? _group;

  bool _isGroupInviteListEnd = false;
  int _groupInviteListPage = 1;
  final List<GroupInvite> _groupInviteList = [];

  bool _isEventListEnd = false;
  int _eventListPage = 1;
  final List<eventModel.Event> _eventList = [];

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    await _getGroupListFunc();
    if (_group?.ownerId == GetIt.I<MeController>().getMe()?.id) {
      _isOwner = true;
    }
    _getGroupInviteListFunc();
    _getEventListFunc();
  }

  Future<void> _getGroupListFunc() async {
    GetGroupListReq getGroupListReq = GetGroupListReq(
      baseListReq: BaseListReq(page: 1, pageSize: 1),
      id: widget.groupId,
    );
    GetGroupListResp? getGroupListResp =
        await api.groupApi.getGroupList(getGroupListReq).catchError((err) {
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
        UpdateGroupInviteStatusReq(
            groupId: widget.groupId, status: status.value);
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
    return groupInvite.invitedByUser != null
        ? 'invited_by${groupInvite.invitedByUser?.username}'
        : "";
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
                              _updateGroupInviteStatusFunc(
                                  GroupInviteStatus.approve);
                            },
                          ),
                          TextButton(
                            child: const Text('Reject'),
                            onPressed: () {
                              _updateGroupInviteStatusFunc(
                                  GroupInviteStatus.reject);
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

  Future<void> _getEventListFunc() async {
    if (_isEventListEnd) {
      return;
    }
    eventModel.GetEventListReq getEventListReq = eventModel.GetEventListReq(
      baseListReq: eventModel.BaseListReq(page: _eventListPage, pageSize: 10),
    );
    eventModel.GetEventListResp? getEventListResp =
        await api.eventApi.getEventList(getEventListReq).catchError((err) {
      log.severe('api.eventApi.getEventList: $err');
      return null;
    });
    _eventListPage += 1;
    if (getEventListResp?.data.data.isNotEmpty ?? false) {
      _eventList.addAll(getEventListResp?.data.data ?? []);
      setState(() {
        _eventList;
      });
    } else {
      _isEventListEnd = true;
    }
  }

  Widget _events() {
    return Column(
      children: _eventList
          .map((v) => {
                Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        leading: const Icon(Icons.album),
                        title: Text(v.name ?? ""),
                        subtitle: Text(formatTimeRange(v.startAt, v.endAt)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          TextButton(
                            child: const Text('View'),
                            onPressed: () {
                              if (mounted) {
                                Navigator.pushReplacementNamed(context, event,
                                    arguments: {
                                      uiEventInitFieldEventId: v.id ?? 0,
                                    });
                              }
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
                  _isOwner ? _groupInvites() : const SizedBox.shrink(),
                  const Text("Events"),
                  _events(),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (mounted) {
              Navigator.pushReplacementNamed(context, createEvent);
            }
          },
          child: const Icon(Icons.flag_circle),
        ));
  }
}
