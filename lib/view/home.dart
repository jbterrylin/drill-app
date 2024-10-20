import 'package:drill_app/api/api.dart';
import 'package:drill_app/model/group.dart';
import 'package:drill_app/state/me.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class UiHome extends StatefulWidget {
  const UiHome({super.key});

  @override
  State<UiHome> createState() => _UiHomeState();
}

class _UiHomeState extends State<UiHome> {
  List<Group> _groups = [];

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    getGroupListFunc();
  }

  Future<void> getGroupListFunc() async {
    GetGroupListReq getGroupListReq = GetGroupListReq(
        baseListReq: BaseListReq(page: 1, pageSize: 10),
        noHaveUserId: GetIt.I<MeController>().getMe()?.id ?? 0);
    GetGroupListResp? getGroupListResp =
        await api.groupApi.getGroupList(getGroupListReq);
    if (getGroupListResp?.base?.code == 0) {
      _groups = getGroupListResp?.data.data ?? [];
      setState(() {
        _groups;
      });
    }
  }

  Future<void> createGroupInviteFunc(Group group) async {
    CreateGroupInviteReq createGroupInviteReq = CreateGroupInviteReq(
        inviteUserId: GetIt.I<MeController>().getMe()?.id ?? 0,
        groupId: group.id);
    OnlyId? createGroupInviteResp =
        await api.groupApi.createGroupInvite(createGroupInviteReq);
    if (createGroupInviteResp?.base?.code == 0) {
      getGroupListFunc();
    }
  }

  Widget _groupCards() {
    return Column(
      children: _groups
          .map((v) => {
                Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        leading: const Icon(Icons.album),
                        title: Text(v.name ?? ""),
                        subtitle: Text(v.ownerId?.toString() ?? ""),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          TextButton(
                            child: const Text('Join'),
                            onPressed: () {/* ... */},
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: RefreshIndicator(
            onRefresh: () async {
              await init();
            },
            child: Center(
              child: Column(
                children: <Widget>[
                  const Text("Group near you"),
                  _groupCards(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
