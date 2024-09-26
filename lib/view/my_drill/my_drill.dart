import 'package:drill_app/api/api.dart';
import 'package:drill_app/component/scrollable_list_view.dart';
import 'package:drill_app/component/vertical_card.dart';
import 'package:drill_app/constant/design.dart';
import 'package:drill_app/constant/router.dart';
import 'package:drill_app/model/group.dart';
import 'package:drill_app/state/me.dart';
import 'package:drill_app/view/group/group.dart';
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

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
  }

  Future<List<Group>> _getGroupListFunc(GetGroupListReq getGroupListReq) async {
    GetGroupListResp? getGroupListResp =
        await api.groupApi.getGroupList(getGroupListReq).catchError((err) {
      log.severe('api.groupApi.getGroupLis: $err');
      return null;
    });
    return getGroupListResp?.data.data ?? [];
  }

  Widget _myGroupCards() {
    return ScrollableListView<Group>(
      height: 157,
      getList: (page) {
        GetGroupListReq getGroupListReq = GetGroupListReq(
          baseListReq: BaseListReq(page: page, pageSize: 10),
          ownerId: GetIt.I<MeController>().getMe()?.id ?? -1,
        );
        return _getGroupListFunc(getGroupListReq);
      },
      getListErrLog: 'api.groupApi.getGroupList',
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, item, index) {
        return VerticalCard(
            press: () {
              if (mounted) {
                Navigator.pushNamed(
                  context,
                  group,
                  arguments: {
                    uiGroupInitFieldGroupId: item.id,
                  },
                );
              }
            },
            image: "https://i.imgur.com/CGCyp1d.png",
            title: item.name ?? "",
          );
      },
      itemPadding: (item, index, length) {
        return EdgeInsets.only(
            left: defaultPadding,
            right: index == length - 1 ? defaultPadding : 0,
          );
      }
    );
  }

  Widget _joinedGroupCards() {
    return ScrollableListView<Group>(
      height: 157,
      getList: (page) {
        GetGroupListReq getGroupListReq = GetGroupListReq(
            baseListReq: BaseListReq(page: page, pageSize: 10),
            haveUserId: GetIt.I<MeController>().getMe()?.id ?? -1);
        return _getGroupListFunc(getGroupListReq);
      },
      getListErrLog: 'api.groupApi.getGroupList',
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, item, index) {
        return VerticalCard(
            press: () {
              if (mounted) {
                Navigator.pushNamed(
                  context,
                  group,
                  arguments: {
                    uiGroupInitFieldGroupId: item.id,
                  },
                );
              }
            },
            image: "https://i.imgur.com/CGCyp1d.png",
            title: item.name ?? "",
          );
      },
      itemPadding: (item, index, length) {
        return EdgeInsets.only(
            left: defaultPadding,
            right: index == length - 1 ? defaultPadding : 0,
          );
      }
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
                  _myGroupCards(),
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
                  _joinedGroupCards(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
