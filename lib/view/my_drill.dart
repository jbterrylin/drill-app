import 'package:drill_app/api/api.dart';
import 'package:drill_app/component/custom_card.dart';
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

  Widget _groupCards(List<Group> groups) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 157,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: groups.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(
                left: defaultPadding,
                right: index == groups.length - 1 ? defaultPadding : 0,
              ),
              child: CustomCard(
                press: () {
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
                image: "https://i.imgur.com/CGCyp1d.png",
                title: groups[index].name ?? "",
              ),
            ),
          ),
        ),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const SizedBox(
                              height: defaultPadding / 2,
                              width: defaultPadding / 4),
                          Padding(
                            padding: const EdgeInsets.all(defaultPadding),
                            child: Text(
                              "My Group",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              if (mounted) {
                                Navigator.pushNamed(context, createGroup);
                              }
                            },
                            child: const Text("+ New Group"),
                          ),
                          const SizedBox(
                              height: defaultPadding / 2,
                              width: defaultPadding),
                        ],
                      ),
                    ],
                  ),
                  _groupCards(_myGroups),
                  Row(
                    children: [
                      const SizedBox(
                          height: defaultPadding / 2,
                          width: defaultPadding / 4),
                      Padding(
                        padding: const EdgeInsets.all(defaultPadding),
                        child: Text(
                          "Joined Group",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                    ],
                  ),
                  _groupCards(_joinedGroups),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
