import 'package:drill_app/api/api.dart';
import 'package:drill_app/model/group.dart';
import 'package:drill_app/state/me.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class MyDrill extends StatefulWidget {
  const MyDrill({super.key});

  @override
  State<MyDrill> createState() => _MyDrillState();
}

class _MyDrillState extends State<MyDrill> {
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
        haveUserId: GetIt.I<MeController>().getMe()?.id ?? 0);
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
    return SingleChildScrollView(
        child: RefreshIndicator(
            onRefresh: () async {
              await init();
            },
            child: Center(
              child: Column(
                children: <Widget>[
                  const Text("My Group"),
                  _groupCards(),
                ],
              ),
            )));
  }
}
