import 'package:drill_app/api/api.dart';
import 'package:drill_app/constant/router.dart';
import 'package:drill_app/model/group.dart';
import 'package:flutter/material.dart';

class UiCreateGroup extends StatefulWidget {
  const UiCreateGroup({super.key});

  @override
  State<UiCreateGroup> createState() => _UiCreateGroupState();
}

class _UiCreateGroupState extends State<UiCreateGroup> {
  final CreateGroupReq _createGroupReq = CreateGroupReq();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {}

  void _updateLoginReq(String input, CreateGroupReqField field) {
    switch (field) {
      case CreateGroupReqField.name:
        _createGroupReq.name = input;
        break;
    }
  }

  Future<void> createGroupFunc() async {
    OnlyId? createGroupResp = await api.groupApi.createGroup(_createGroupReq);
    if (createGroupResp?.base?.code == 0) {
      if (mounted) {
        Navigator.pushReplacementNamed(context, myDrill);
      }
    }
  }

  Widget _createGroupForm() {
    return Column(
      children: <Widget>[
        SizedBox(
          width: 250,
          child: TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Name',
            ),
            controller: TextEditingController(text: _createGroupReq.name),
            onChanged: (value) =>
                _updateLoginReq(value, CreateGroupReqField.name),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Create Group"),
        leading: BackButton(
          onPressed: () {
            if (mounted) {
              Navigator.pop(context);
            }
          },
        ),
      ),
      body: SingleChildScrollView(
        child: RefreshIndicator(
          onRefresh: () async {
            await init();
          },
          child: Center(
            child: Column(
              children: <Widget>[
                const Text("New Group"),
                _createGroupForm(),
                TextButton(
                  onPressed: () {
                    createGroupFunc();
                  },
                  child: const Text("Create"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
