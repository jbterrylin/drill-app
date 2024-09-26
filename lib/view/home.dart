import 'package:drill_app/api/api.dart';
import 'package:drill_app/component/bottom_bar.dart';
import 'package:drill_app/model/group.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Group> _groups = [];

  _HomeState() {
    init();
  }

  void init() async {
    getGroupListFunc();
  }

  void getGroupListFunc() async {
    GetGroupListReq getGroupListReq =
        GetGroupListReq(baseListReq: BaseListReq(page: 1, pageSize: 10));
    GetGroupListResp? getGroupListResp =
        await api.groupApi.getGroupList(getGroupListReq);
    if (getGroupListResp?.base?.code == 0) {
      _groups = getGroupListResp?.data.data ?? [];
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
                      const ListTile(
                        leading: Icon(Icons.album),
                        title: Text('The Enchanted Nightingale'),
                        subtitle: Text(
                            'Music by Julie Gable. Lyrics by Sidney Stein.'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          TextButton(
                            child: const Text('BUY TICKETS'),
                            onPressed: () {/* ... */},
                          ),
                          const SizedBox(width: 8),
                          TextButton(
                            child: const Text('LISTEN'),
                            onPressed: () {/* ... */},
                          ),
                          const SizedBox(width: 8),
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
