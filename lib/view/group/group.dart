import 'package:drill_app/api/api.dart';
import 'package:drill_app/constant/design.dart';
import 'package:drill_app/constant/router.dart';
import 'package:drill_app/model/event.dart' as event_model;
import 'package:drill_app/model/group.dart';
import 'package:drill_app/state/me.dart';
import 'package:drill_app/util/date.dart';
import 'package:drill_app/view/event/event.dart';
import 'package:drill_app/view/group/group_event_list.dart';
import 'package:drill_app/view/group/group_info.dart';
import 'package:drill_app/view/group/group_request_list.dart';
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

  bool _isEventListEnd = false;
  int _eventListPage = 1;
  final List<event_model.Event> _eventList = [];

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

  Future<void> _getEventListFunc() async {
    if (_isEventListEnd) {
      return;
    }
    event_model.GetEventListReq getEventListReq = event_model.GetEventListReq(
      baseListReq: event_model.BaseListReq(page: _eventListPage, pageSize: 10),
    );
    event_model.GetEventListResp? getEventListResp =
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
                                Navigator.pushNamed(context, event, arguments: {
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
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Group"),
          leading: BackButton(
            onPressed: () {
              if (mounted) {
                Navigator.pop(context);
              }
            },
          ),
        ),
        bottomNavigationBar: TextButton(
          onPressed: () {
            if (mounted) {
              Navigator.pushNamed(context, createEvent);
            }
          },
          child: const Text("Create Event"),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UiGroupInfo(group: _group),
                UiGroupRequestList(group: _group),
                const SizedBox(height: defaultPadding),
                UiGroupEventList(group: _group),
              ],
            ),
          ),
        ));
  }
}
