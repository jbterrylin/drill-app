import 'package:drill_app/api/api.dart';
import 'package:drill_app/component/horizontal_card.dart';
import 'package:drill_app/component/scrollable_list_view.dart';
import 'package:drill_app/constant/design.dart';
import 'package:drill_app/model/event.dart';
import 'package:drill_app/state/me.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:logging/logging.dart';

class UiEventUserList extends StatefulWidget {
  const UiEventUserList({super.key, required this.event});

  final Event? event;

  @override
  State<UiEventUserList> createState() => _UiEventUserListState();
}

class _UiEventUserListState extends State<UiEventUserList> {
  final log = Logger('UiEventUserList');

  bool _isOwner = false;

  Event? _event;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    if (_event?.group?.ownerId == GetIt.I<MeController>().getMe()?.id) {
      _isOwner = true;
    }
  }

  Future<List<EventUser>> _getEventUserListFunc(
      GetEventUserListReq getEventUserListReq) async {
    GetEventUserListResp? getEventUserListResp = await api.eventApi
        .getEventUserList(getEventUserListReq)
        .catchError((err) {
      log.severe('api.eventApi.getEventUserList: $err');
      return null;
    });
    return getEventUserListResp?.data.data ?? [];
  }

  Widget _eventUsers() {
    return ScrollableListView<EventUser>(
        height: 300,
        getList: (page) {
          GetEventUserListReq getEventUserListReq = GetEventUserListReq(
            baseListReq: BaseListReq(page: page, pageSize: 10),
          );
          return _getEventUserListFunc(getEventUserListReq);
        },
        getListErrLog: 'api.eventApi.getEventList',
        scrollDirection: Axis.vertical,
        itemBuilder: (context, item, index) {
          return HorizontalCard(
            minimumSize: const Size(50, 100),
            maximumSize: const Size(50, 100),
            press: () {},
            title: item.user?.username,
          );
        },
        itemPadding: (item, index, length) {
          return EdgeInsets.only(
            bottom: defaultPadding,
            top: index == length - 1 ? defaultPadding : 0,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Text("Event Users"),
        _eventUsers(),
      ],
    );
  }
}
