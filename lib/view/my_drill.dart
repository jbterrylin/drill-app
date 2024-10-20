import 'package:drill_app/api/api.dart';
import 'package:drill_app/constant/design.dart';
import 'package:drill_app/constant/router.dart';
import 'package:drill_app/model/group.dart';
import 'package:drill_app/state/me.dart';
import 'package:drill_app/view/group.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:logging/logging.dart';

class UiMyDrill extends StatefulWidget {
  const UiMyDrill({super.key});

  @override
  State<UiMyDrill> createState() => _UiMyDrillState();
}

class _UiMyDrillState extends State<UiMyDrill> {
  final log = Logger('UiMyDrill');

  bool isMyGroupsEnd = false;
  int _myGroupsPage = 1;
  final List<Group> _myGroups = [];

  bool isJoinedGroupsEnd = false;
  int _joinedGroupsPage = 1;
  final List<Group> _joinedGroups = [];

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    _getMyGroup();
    _getJoinedGroup();
  }

  Future<void> _getMyGroup() async {
    if (isMyGroupsEnd) {
      return;
    }
    GetGroupListReq getGroupListReq = GetGroupListReq(
      baseListReq: BaseListReq(page: _myGroupsPage, pageSize: 10),
      ownerId: GetIt.I<MeController>().getMe()?.id ?? -1,
    );
    final groupList = await _getGroupListFunc(getGroupListReq);
    _myGroupsPage += 1;
    if (groupList.isEmpty) {
      isJoinedGroupsEnd = true;
    }
    _myGroups.addAll(groupList);
    setState(() {
      _myGroups;
    });
  }

  Future<void> _getJoinedGroup() async {
    if (isJoinedGroupsEnd) {
      return;
    }
    GetGroupListReq getGroupListReq = GetGroupListReq(
        baseListReq: BaseListReq(page: _joinedGroupsPage, pageSize: 10),
        haveUserId: GetIt.I<MeController>().getMe()?.id ?? -1);
    final groupList = await _getGroupListFunc(getGroupListReq);
    _joinedGroupsPage += 1;
    if (groupList.isEmpty) {
      isJoinedGroupsEnd = true;
    }
    groupList.removeWhere(
        (v) => v.ownerId == (GetIt.I<MeController>().getMe()?.id ?? -1));
    _joinedGroups.addAll(groupList);
    setState(() {
      _joinedGroups;
    });
  }

  Future<List<Group>> _getGroupListFunc(GetGroupListReq getGroupListReq) async {
    GetGroupListResp? getGroupListResp =
        await api.groupApi.getGroupList(getGroupListReq).catchError((err) {
      log.severe('api.groupApi.getGroupLis: $err');
      return null;
    });
    return getGroupListResp?.data.data ?? [];
  }

  Widget _groupCards(List<Group> groups,String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: defaultPadding / 2),
        Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        // While loading use 👇
        // const ProductsSkelton(),
        SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: groups.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(
                left: defaultPadding,
                right: index == groups.length - 1 ? defaultPadding : 0,
              ),
              child: SizedBox(
                width: 300, // Set your desired width
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        leading: const Icon(Icons.album),
                        title: Text(groups[index].name ?? ""),
                        subtitle: Text(groups[index].ownerId?.toString() ?? ""),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          TextButton(
                            child: const Text('Watch Detail'),
                            onPressed: () {
                              if (mounted) {
                                Navigator.pushNamed(
                                  context,
                                  group,
                                  arguments: {
                                    uiGroupInitFieldGroupId: groups[index].id,
                                  },
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ],
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
                  TextButton(
                    onPressed: () {
                      if (mounted) {
                        Navigator.pushNamed(context, createGroup);
                      }
                    },
                    child: const Text("Create My Group"),
                  ),
                  _groupCards(_myGroups, "My Group"),
                  _groupCards(_joinedGroups,"Joined Group"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
