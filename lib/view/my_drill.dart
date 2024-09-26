import 'package:drill_app/api/api.dart';
import 'package:drill_app/component/bottom_bar.dart';
import 'package:drill_app/model/group.dart';
import 'package:drill_app/util/secure_storage/secure_storage.dart';
import 'package:flutter/material.dart';

class MyDrill extends StatefulWidget {
  const MyDrill({super.key});

  @override
  State<MyDrill> createState() => _MyDrillState();
}

class _MyDrillState extends State<MyDrill> {
  List<Group> _groups = [];

  _MyDrillState() {
    init();
  }

  void init() async {
    getGroupListFunc();
  }

  void getGroupListFunc() async {
    GetGroupListReq getGroupListReq =
        GetGroupListReq(baseListReq: BaseListReq(page: 1, pageSize: 10), haveUserId: await getUserId() ?? 0);
    GetGroupListResp? getGroupListResp =
        await api.groupApi.getGroupList(getGroupListReq);
    if (getGroupListResp?.base?.code == 0) {
      _groups = getGroupListResp?.data.data ?? [];
      setState(() {
        _groups;
      });
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
                            child: const Text('Watch Detail'),
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
    return BottomBar(
        title: "Home",
        selectedIndex: BottomBarIndex.home,
        body: Center(
          child: Column(
            children: <Widget>[
              const Text("Group near you"),
              _groupCards(),
            ],
          ),
        ));
  }
}
