import 'package:drill_app/api/api.dart';
import 'package:drill_app/component/horizontal_card.dart';
import 'package:drill_app/component/scrollable_list_view.dart';
import 'package:drill_app/constant/design.dart';
import 'package:drill_app/constant/router.dart';
import 'package:drill_app/model/group.dart';
import 'package:drill_app/model/group_enum.dart';
import 'package:drill_app/state/me.dart';
import 'package:drill_app/view/group/group.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:logging/logging.dart';

class UiGroupRequestList extends StatefulWidget {
  const UiGroupRequestList({super.key, required this.group});

  final Group? group;

  @override
  State<UiGroupRequestList> createState() => _UiGroupRequestListState();
}

class _UiGroupRequestListState extends State<UiGroupRequestList> {
  final log = Logger('UiGroupRequestList');

  bool _isOwner = false;

  Group? _group;

  final GlobalKey<ScrollableListViewState<GroupInvite>> _groupInviteListState =
      GlobalKey();

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

  Future<List<GroupInvite>> _getGroupInviteListFunc(
      GetGroupInviteListReq getGroupInviteListReq) async {
    GetGroupInviteListResp? getGroupInviteListResp = await api.groupApi
        .getGroupInviteList(getGroupInviteListReq)
        .catchError((err) {
      log.severe('api.groupApi.getGroupInviteList: $err');
      return null;
    });
    return getGroupInviteListResp?.data.data ?? [];
  }

  Future<void> _updateGroupInviteStatusFunc(
      GroupInvite groupInvite, EnumGroupInviteStatus status) async {
    UpdateGroupInviteStatusReq updateGroupInviteStatusReq =
        UpdateGroupInviteStatusReq(id: groupInvite.id, status: status.value);
    Base? updateGroupInviteStatusResp = await api.groupApi
        .updateGroupInviteStatus(updateGroupInviteStatusReq)
        .catchError((err) {
      log.severe('api.groupApi.updateGroupInviteStatus: $err');
      return null;
    });
    if (updateGroupInviteStatusResp?.code == 0) {
      _groupInviteListState.currentState?.list
          .removeWhere((item) => item.id == groupInvite.id);
    } else {
      _groupInviteListState.currentState?.getList(reset: true);
    }
  }

  String _inviteInfo(GroupInvite groupInvite) {
    if (groupInvite.inviteUserId == groupInvite.invitedBy) {
      return "self_invite";
    }
    return groupInvite.invitedByUser != null
        ? 'invited_by ${groupInvite.invitedByUser?.username}'
        : "";
  }

  Widget _groupInvites() {
    return ScrollableListView<GroupInvite>(
      height: 110,
      getList: (page) {
        GetGroupInviteListReq getGroupInviteListReq = GetGroupInviteListReq(
          baseListReq: BaseListReq(page: page, pageSize: 10),
        );
        return _getGroupInviteListFunc(getGroupInviteListReq);
      },
      getListErrLog: 'api.eventApi.getEventList',
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, item, index) {
        return HorizontalCard(
          maximumSize: const Size(300, 250),
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
          title: item.inviteUser?.username ?? "",
          content: _inviteInfo(item),
          extra: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: const Text('Accept'),
                onPressed: () {
                  _updateGroupInviteStatusFunc(
                      item, EnumGroupInviteStatus.approve);
                },
              ),
              TextButton(
                child: const Text('Reject'),
                onPressed: () {
                  _updateGroupInviteStatusFunc(
                      item, EnumGroupInviteStatus.reject);
                },
              ),
            ],
          ),
        );
      },
      itemPadding: (item, index, length) {
        return EdgeInsets.only(
          left: defaultPadding,
          right: index == length - 1 ? defaultPadding : 0,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: SizedBox(
            child: Text(
              "Pending Group Requests",
              style: Theme.of(context).textTheme.titleSmall!,
            ),
          ),
        ),
        _groupInvites(),
      ],
    );
  }
}
