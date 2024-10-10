import 'package:drill_app/api/api.dart';
import 'package:drill_app/component/horizontal_card.dart';
import 'package:drill_app/component/scrollable_list_view.dart';
import 'package:drill_app/constant/design.dart';
import 'package:drill_app/constant/router.dart';
import 'package:drill_app/model/event.dart' as event_model;
import 'package:drill_app/model/group.dart';
import 'package:drill_app/state/me.dart';
import 'package:drill_app/view/event/event.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:logging/logging.dart';

class UiGroupEventList extends StatefulWidget {
  const UiGroupEventList({super.key, required this.group});

  final Group? group;

  @override
  State<UiGroupEventList> createState() => _UiGroupEventListState();
}

class _UiGroupEventListState extends State<UiGroupEventList> {
  final log = Logger('UiGroupEventList');

  bool _isOwner = false;

  Group? _group;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    if (_group?.ownerId == GetIt.I<MeController>().getMe()?.id) {
      _isOwner = true;
    }
  }

  Future<List<event_model.Event>> _getEventListFunc(
      event_model.GetEventListReq getEventListReq) async {
    event_model.GetEventListResp? getEventListResp =
        await api.eventApi.getEventList(getEventListReq).catchError((err) {
      log.severe('api.eventApi.getEventList: $err');
      return null;
    });
    return getEventListResp?.data.data ?? [];
  }

  Widget _events() {
    return ScrollableListView<event_model.Event>(
      height: 300,
      getList: (page) {
        event_model.GetEventListReq getEventListReq =
            event_model.GetEventListReq(
          baseListReq: event_model.BaseListReq(page: page, pageSize: 10),
        );
        return _getEventListFunc(getEventListReq);
      },
      getListErrLog: 'api.eventApi.getEventList',
      scrollDirection: Axis.vertical,
      itemBuilder: (context, item, index) {
        return HorizontalCard(
          minimumSize: const Size(50, 100),
          maximumSize: const Size(50, 100),
          press: () {
            if (mounted) {
              Navigator.pushNamed(context, event, arguments: {
                uiEventInitFieldEventId: item.id ?? 0,
              });
            }
          },
          title: item.name,
          content: item.startAt,
        );
      },
      itemPadding: (item, index, length) {
        return const EdgeInsets.only(
          bottom: defaultPadding,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: SizedBox(
          child: Text(
            "Events",
            style: Theme.of(context).textTheme.titleSmall!,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: _events(),
      )
    ]);
  }
}
