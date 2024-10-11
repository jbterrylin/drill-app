import 'package:drill_app/api/api.dart';
import 'package:drill_app/component/date_time_picker.dart';
import 'package:drill_app/constant/router.dart';
import 'package:drill_app/model/event.dart';
import 'package:drill_app/view/event/event.dart';
import 'package:flutter/material.dart';

const uiCreateEventInitFieldGroupId = "groupId";

class UiCreateEvent extends StatefulWidget {
  const UiCreateEvent({super.key, required this.groupId});

  final int groupId;

  @override
  State<UiCreateEvent> createState() => _UiCreateEventState();
}

class _UiCreateEventState extends State<UiCreateEvent> {
  final CreateEventReq _createEventReq = CreateEventReq();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    _createEventReq.groupId = widget.groupId;
  }

  void _updateLoginReq(dynamic input, CreateEventReqField field) {
    switch (field) {
      case CreateEventReqField.name:
        _createEventReq.name = input;
        break;
      case CreateEventReqField.startAt:
        _createEventReq.startAt = input;
        setState(() {
          _createEventReq;
        });
        break;
      case CreateEventReqField.endAt:
        _createEventReq.endAt = input;
        setState(() {
          _createEventReq;
        });
        break;
      case CreateEventReqField.groupId:
        break;
    }
  }

  Future<void> createEventFunc() async {
    OnlyId? createEventResp = await api.eventApi.createEvent(_createEventReq);
    if (createEventResp?.base?.code == 0) {
      if (mounted) {
        Navigator.pushReplacementNamed(
          context,
          event,
          arguments: {
            uiEventInitFieldEventId: createEventResp?.id ?? 0,
          },
        );
      }
    }
  }

  Widget _createEventForm() {
    return Column(
      children: <Widget>[
        SizedBox(
          width: 250,
          child: TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Name',
            ),
            controller: TextEditingController(text: _createEventReq.name),
            onChanged: (value) =>
                _updateLoginReq(value, CreateEventReqField.name),
          ),
        ),
        SizedBox(
          width: 250,
          child: DateTimePicker(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "startAt",
              ),
              initialDateTime: _createEventReq.startAt != null
                  ? DateTime.parse(_createEventReq.startAt ?? "")
                  : null,
              onDateTimeChanged: (DateTime value) {
                _updateLoginReq(value.toUtc().toIso8601String(),
                    CreateEventReqField.startAt);
              }),
        ),
        SizedBox(
          width: 250,
          child: DateTimePicker(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "endAt",
              ),
              initialDateTime: _createEventReq.endAt != null
                  ? DateTime.parse(_createEventReq.endAt ?? "")
                  : null,
              onDateTimeChanged: (DateTime value) {
                _updateLoginReq(
                    value.toUtc().toIso8601String(), CreateEventReqField.endAt);
              }),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Create Event"),
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
                const Text("New Event"),
                _createEventForm(),
                TextButton(
                  onPressed: () {
                    createEventFunc();
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
