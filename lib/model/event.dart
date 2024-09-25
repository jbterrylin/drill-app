enum BaseField {
  code,
  msg,
}

class Base {
  int code;
  String msg;

  Base({
    required this.code,
    required this.msg,
  });

  // 从 JSON 构造 Base 对象
  factory Base.fromJson(Map<String, dynamic> json) {
    return Base(
      code: json['code'],
      msg: json['msg'],
    );
  }

  // 将 Base 对象转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'msg': msg,
    };
  }
}

enum BaseListReqField {
  noPagination,
  page,
  pageSize,
  orderBy,
  sort,
}

class BaseListReq {
  bool? noPagination;
  int? page;
  int? pageSize;
  List<String>? orderBy;
  List<String>? sort;

  BaseListReq({
    this.noPagination,
    this.page,
    this.pageSize,
    this.orderBy,
    this.sort,
  });

  // 从 JSON 构造 BaseListReq 对象
  factory BaseListReq.fromJson(Map<String, dynamic> json) {
    return BaseListReq(
      noPagination: json['no_pagination'],
      page: json['page'],
      pageSize: json['page_size'],
      orderBy: json['order_by'],
      sort: json['sort'],
    );
  }

  // 将 BaseListReq 对象转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'no_pagination': noPagination,
      'page': page,
      'page_size': pageSize,
      'order_by': orderBy,
      'sort': sort,
    };
  }
}

enum CreateEventReqField {
  name,
  startAt,
  endAt,
  groupId,
}

class CreateEventReq {
  String? name;
  String? startAt;
  String? endAt;
  int? groupId;

  CreateEventReq({
    this.name,
    this.startAt,
    this.endAt,
    this.groupId,
  });

  // 从 JSON 构造 CreateEventReq 对象
  factory CreateEventReq.fromJson(Map<String, dynamic> json) {
    return CreateEventReq(
      name: json['name'],
      startAt: json['start_at'],
      endAt: json['end_at'],
      groupId: json['group_id'],
    );
  }

  // 将 CreateEventReq 对象转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'start_at': startAt,
      'end_at': endAt,
      'group_id': groupId,
    };
  }
}

enum EventField {
  id,
  createdAt,
  updatedAt,
  createdBy,
  name,
  status,
  startAt,
  endAt,
  transId,
  groupId,
  eventUsers,
  group,
}

class Event {
  int? id;
  String? createdAt;
  String? updatedAt;
  int? createdBy;
  String? name;
  int? status;
  String? startAt;
  String? endAt;
  String? transId;
  int? groupId;
  List<EventUser>? eventUsers;
  Group? group;

  Event({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.name,
    this.status,
    this.startAt,
    this.endAt,
    this.transId,
    this.groupId,
    this.eventUsers,
    this.group,
  });

  // 从 JSON 构造 Event 对象
  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      createdBy: json['created_by'],
      name: json['name'],
      status: json['status'],
      startAt: json['start_at'],
      endAt: json['end_at'],
      transId: json['trans_id'],
      groupId: json['group_id'],
      eventUsers: json['event_users'] != null
          ? (json['event_users'] as List)
              .map((v) => EventUser.fromJson(v))
              .toList()
          : null,
      group: json['group'] != null ? Group?.fromJson(json['group']) : null,
    );
  }

  // 将 Event 对象转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'created_by': createdBy,
      'name': name,
      'status': status,
      'start_at': startAt,
      'end_at': endAt,
      'trans_id': transId,
      'group_id': groupId,
      'event_users': eventUsers?.map((v) => v.toJson()),
      'group': group?.toJson(),
    };
  }
}

enum EventUserField {
  id,
  createdAt,
  updatedAt,
  eventId,
  userId,
  status,
  transId,
  event,
  user,
}

class EventUser {
  int? id;
  String? createdAt;
  String? updatedAt;
  int? eventId;
  int? userId;
  int? status;
  String? transId;
  Event? event;
  User? user;

  EventUser({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.eventId,
    this.userId,
    this.status,
    this.transId,
    this.event,
    this.user,
  });

  // 从 JSON 构造 EventUser 对象
  factory EventUser.fromJson(Map<String, dynamic> json) {
    return EventUser(
      id: json['id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      eventId: json['event_id'],
      userId: json['user_id'],
      status: json['status'],
      transId: json['trans_id'],
      event: json['event'] != null ? Event?.fromJson(json['event']) : null,
      user: json['user'] != null ? User?.fromJson(json['user']) : null,
    );
  }

  // 将 EventUser 对象转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'event_id': eventId,
      'user_id': userId,
      'status': status,
      'trans_id': transId,
      'event': event?.toJson(),
      'user': user?.toJson(),
    };
  }
}

enum GetEventListReqField {
  baseListReq,
  id,
  groupId,
}

class GetEventListReq {
  BaseListReq? baseListReq;
  int? id;
  int? groupId;

  GetEventListReq({
    this.baseListReq,
    this.id,
    this.groupId,
  });

  // 从 JSON 构造 GetEventListReq 对象
  factory GetEventListReq.fromJson(Map<String, dynamic> json) {
    return GetEventListReq(
      baseListReq: BaseListReq.fromJson(json),
      id: json['id'],
      groupId: json['group_id'],
    );
  }

  // 将 GetEventListReq 对象转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      ...baseListReq?.toJson() ?? {},
      'id': id,
      'group_id': groupId,
    };
  }
}

enum GetEventListRespDataField {
  data,
  total,
}

class GetEventListRespData {
  List<Event> data;
  int total;

  GetEventListRespData({
    required this.data,
    required this.total,
  });

  // 从 JSON 构造 GetEventListRespData 对象
  factory GetEventListRespData.fromJson(Map<String, dynamic> json) {
    return GetEventListRespData(
      data: json['data'] != null
          ? (json['data'] as List).map((v) => Event.fromJson(v)).toList()
          : [],
      total: json['total'],
    );
  }

  // 将 GetEventListRespData 对象转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'data': data.map((v) => v.toJson()),
      'total': total,
    };
  }
}

enum GetEventListRespField {
  base,
  data,
}

class GetEventListResp {
  Base? base;
  GetEventListRespData data;

  GetEventListResp({
    this.base,
    required this.data,
  });

  // 从 JSON 构造 GetEventListResp 对象
  factory GetEventListResp.fromJson(Map<String, dynamic> json) {
    return GetEventListResp(
      base: Base.fromJson(json),
      data: GetEventListRespData.fromJson(json['data']),
    );
  }

  // 将 GetEventListResp 对象转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      ...base?.toJson() ?? {},
      'data': data.toJson(),
    };
  }
}

enum GetEventUserListReqField {
  baseListReq,
  eventId,
}

class GetEventUserListReq {
  BaseListReq? baseListReq;
  int? eventId;

  GetEventUserListReq({
    this.baseListReq,
    this.eventId,
  });

  // 从 JSON 构造 GetEventUserListReq 对象
  factory GetEventUserListReq.fromJson(Map<String, dynamic> json) {
    return GetEventUserListReq(
      baseListReq: BaseListReq.fromJson(json),
      eventId: json['event_id'],
    );
  }

  // 将 GetEventUserListReq 对象转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      ...baseListReq?.toJson() ?? {},
      'event_id': eventId,
    };
  }
}

enum GetEventUserListRespDataField {
  data,
  total,
}

class GetEventUserListRespData {
  List<EventUser> data;
  int total;

  GetEventUserListRespData({
    required this.data,
    required this.total,
  });

  // 从 JSON 构造 GetEventUserListRespData 对象
  factory GetEventUserListRespData.fromJson(Map<String, dynamic> json) {
    return GetEventUserListRespData(
      data: json['data'] != null
          ? (json['data'] as List).map((v) => EventUser.fromJson(v)).toList()
          : [],
      total: json['total'],
    );
  }

  // 将 GetEventUserListRespData 对象转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'data': data.map((v) => v.toJson()),
      'total': total,
    };
  }
}

enum GetEventUserListRespField {
  base,
  data,
}

class GetEventUserListResp {
  Base? base;
  GetEventUserListRespData data;

  GetEventUserListResp({
    this.base,
    required this.data,
  });

  // 从 JSON 构造 GetEventUserListResp 对象
  factory GetEventUserListResp.fromJson(Map<String, dynamic> json) {
    return GetEventUserListResp(
      base: Base.fromJson(json),
      data: GetEventUserListRespData.fromJson(json['data']),
    );
  }

  // 将 GetEventUserListResp 对象转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      ...base?.toJson() ?? {},
      'data': data.toJson(),
    };
  }
}

enum GroupField {
  id,
  createdAt,
  updatedAt,
  ownerId,
  isActive,
  name,
  transId,
  groupUsers,
}

class Group {
  int? id;
  String? createdAt;
  String? updatedAt;
  int? ownerId;
  int? isActive;
  String? name;
  String? transId;
  List<GroupUser>? groupUsers;

  Group({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.ownerId,
    this.isActive,
    this.name,
    this.transId,
    this.groupUsers,
  });

  // 从 JSON 构造 Group 对象
  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      id: json['id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      ownerId: json['owner_id'],
      isActive: json['is_active'],
      name: json['name'],
      transId: json['trans_id'],
      groupUsers: json['group_users'] != null
          ? (json['group_users'] as List)
              .map((v) => GroupUser.fromJson(v))
              .toList()
          : null,
    );
  }

  // 将 Group 对象转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'owner_id': ownerId,
      'is_active': isActive,
      'name': name,
      'trans_id': transId,
      'group_users': groupUsers?.map((v) => v.toJson()),
    };
  }
}

enum GroupInviteField {
  id,
  createdAt,
  updatedAt,
  invitedBy,
  inviteUserId,
  status,
  transId,
  groupId,
  group,
  inviteUser,
  invitedByUser,
}

class GroupInvite {
  int? id;
  String? createdAt;
  String? updatedAt;
  int? invitedBy;
  int? inviteUserId;
  int? status;
  String? transId;
  int? groupId;
  Group? group;
  User? inviteUser;
  User? invitedByUser;

  GroupInvite({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.invitedBy,
    this.inviteUserId,
    this.status,
    this.transId,
    this.groupId,
    this.group,
    this.inviteUser,
    this.invitedByUser,
  });

  // 从 JSON 构造 GroupInvite 对象
  factory GroupInvite.fromJson(Map<String, dynamic> json) {
    return GroupInvite(
      id: json['id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      invitedBy: json['invited_by'],
      inviteUserId: json['invite_user_id'],
      status: json['status'],
      transId: json['trans_id'],
      groupId: json['group_id'],
      group: json['group'] != null ? Group?.fromJson(json['group']) : null,
      inviteUser: json['invite_user'] != null
          ? User?.fromJson(json['invite_user'])
          : null,
      invitedByUser: json['invited_by_user'] != null
          ? User?.fromJson(json['invited_by_user'])
          : null,
    );
  }

  // 将 GroupInvite 对象转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'invited_by': invitedBy,
      'invite_user_id': inviteUserId,
      'status': status,
      'trans_id': transId,
      'group_id': groupId,
      'group': group?.toJson(),
      'invite_user': inviteUser?.toJson(),
      'invited_by_user': invitedByUser?.toJson(),
    };
  }
}

enum GroupUserField {
  id,
  createdAt,
  updatedAt,
  isActive,
  groupId,
  userId,
  transId,
  group,
  user,
}

class GroupUser {
  int? id;
  String? createdAt;
  String? updatedAt;
  int? isActive;
  int? groupId;
  int? userId;
  String? transId;
  Group? group;
  User? user;

  GroupUser({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.isActive,
    this.groupId,
    this.userId,
    this.transId,
    this.group,
    this.user,
  });

  // 从 JSON 构造 GroupUser 对象
  factory GroupUser.fromJson(Map<String, dynamic> json) {
    return GroupUser(
      id: json['id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      isActive: json['is_active'],
      groupId: json['group_id'],
      userId: json['user_id'],
      transId: json['trans_id'],
      group: json['group'] != null ? Group?.fromJson(json['group']) : null,
      user: json['user'] != null ? User?.fromJson(json['user']) : null,
    );
  }

  // 将 GroupUser 对象转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'is_active': isActive,
      'group_id': groupId,
      'user_id': userId,
      'trans_id': transId,
      'group': group?.toJson(),
      'user': user?.toJson(),
    };
  }
}

enum OnlyIdField {
  base,
  id,
}

class OnlyId {
  Base? base;
  int id;

  OnlyId({
    this.base,
    required this.id,
  });

  // 从 JSON 构造 OnlyId 对象
  factory OnlyId.fromJson(Map<String, dynamic> json) {
    return OnlyId(
      base: Base.fromJson(json),
      id: json['id'],
    );
  }

  // 将 OnlyId 对象转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      ...base?.toJson() ?? {},
      'id': id,
    };
  }
}

enum UpdateEventUserStatusReqField {
  eventId,
  status,
}

class UpdateEventUserStatusReq {
  int? eventId;
  int? status;

  UpdateEventUserStatusReq({
    this.eventId,
    this.status,
  });

  // 从 JSON 构造 UpdateEventUserStatusReq 对象
  factory UpdateEventUserStatusReq.fromJson(Map<String, dynamic> json) {
    return UpdateEventUserStatusReq(
      eventId: json['event_id'],
      status: json['status'],
    );
  }

  // 将 UpdateEventUserStatusReq 对象转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'event_id': eventId,
      'status': status,
    };
  }
}

enum UserField {
  id,
  createdAt,
  updatedAt,
  username,
  password,
  transId,
}

class User {
  int? id;
  String? createdAt;
  String? updatedAt;
  String? username;
  String? password;
  String? transId;

  User({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.username,
    this.password,
    this.transId,
  });

  // 从 JSON 构造 User 对象
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      username: json['username'],
      password: json['password'],
      transId: json['trans_id'],
    );
  }

  // 将 User 对象转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'username': username,
      'password': password,
      'trans_id': transId,
    };
  }
}
