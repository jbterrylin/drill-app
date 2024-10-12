import 'package:drill_app/api/api.dart';
import 'package:drill_app/model/event.dart';
import 'package:drill_app/state/me.dart';
import 'package:drill_app/view/event/event_user_list.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:logging/logging.dart';

const uiEventInitFieldEventId = "eventId";

class UiEvent extends StatefulWidget {
  const UiEvent({super.key, required this.eventId});

  final int eventId;

  @override
  State<UiEvent> createState() => _UiEventState();
}

class _UiEventState extends State<UiEvent> {
  final log = Logger('UiEvent');

  bool _isOwner = false;

  Event? _event;

  bool _isEventUserListEnd = false;
  int _eventUserListPage = 1;
  final List<EventUser> _eventUserList = [];

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    await _getEventListFunc();
    if (_event?.group?.ownerId == GetIt.I<MeController>().getMe()?.id) {
      _isOwner = true;
    }
    _getEventUserListFunc();
  }

  Future<void> _getEventListFunc() async {
    GetEventListReq getEventListReq = GetEventListReq(
      baseListReq: BaseListReq(page: 1, pageSize: 1),
      id: widget.eventId,
    );
    GetEventListResp? getEventListResp =
        await api.eventApi.getEventList(getEventListReq).catchError((err) {
      log.severe('api.eventApi.getEventList: $err');
      return null;
    });
    if (getEventListResp?.data.data.isNotEmpty ?? false) {
      _event = getEventListResp?.data.data.first;
      setState(() {
        _event;
      });
    }
  }

  Future<void> _getEventUserListFunc() async {
    if (_isEventUserListEnd) {
      return;
    }
    GetEventUserListReq getEventUserListReq = GetEventUserListReq(
      baseListReq: BaseListReq(page: _eventUserListPage, pageSize: 10),
    );
    GetEventUserListResp? getEventUserListResp = await api.eventApi
        .getEventUserList(getEventUserListReq)
        .catchError((err) {
      log.severe('api.eventApi.getEventUserList: $err');
      return null;
    });
    _eventUserListPage += 1;
    if (getEventUserListResp?.data.data.isNotEmpty ?? false) {
      _eventUserList.addAll(getEventUserListResp?.data.data ?? []);
      setState(() {
        _eventUserList;
      });
    } else {
      _isEventUserListEnd = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Event"),
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
                Text('Event Detail ${_event?.name}'),
                UiEventUserList(event: _event),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
