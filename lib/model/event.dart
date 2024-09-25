class Base {
  final int code;
  final String msg;

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

class BaseListReq {
  final bool? noPagination;
  final int? page;
  final int? pageSize;
  final List<String>? orderBy;
  final List<String>? sort;

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

class CreateEventReq {
  final String? name;
  final String? startAt;
  final String? endAt;
  final int? groupId;

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

class Event {
  final int? id;
  final String? createdAt;
  final String? updatedAt;
  final int? createdBy;
  final String? name;
  final int? status;
  final String? startAt;
  final String? endAt;
  final String? transId;
  final int? groupId;
  final List<EventUser>? eventUsers;

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
      eventUsers: json['event_users'],
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
      'event_users': eventUsers,
    };
  }
}

class EventUser {
  final int? id;
  final String? createdAt;
  final String? updatedAt;
  final int? eventId;
  final int? userId;
  final int? status;
  final String? transId;
  final Event? event;
  final User? user;

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
      event: json['event'],
      user: json['user'],
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
      'event': event,
      'user': user,
    };
  }
}

class GetEventListReq {
  final BaseListReq? baseListReq;
  final int? groupId;

  GetEventListReq({
    this.baseListReq,
    this.groupId,
  });

  // 从 JSON 构造 GetEventListReq 对象
  factory GetEventListReq.fromJson(Map<String, dynamic> json) {
    return GetEventListReq(
      baseListReq: BaseListReq.fromJson(json),
      groupId: json['group_id'],
    );
  }

  // 将 GetEventListReq 对象转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      ...baseListReq?.toJson() ?? {},
      'group_id': groupId,
    };
  }
}

class GetEventListRespData {
  final List<Event> data;
  final int total;

  GetEventListRespData({
    required this.data,
    required this.total,
  });

  // 从 JSON 构造 GetEventListRespData 对象
  factory GetEventListRespData.fromJson(Map<String, dynamic> json) {
    return GetEventListRespData(
      data: json['data'],
      total: json['total'],
    );
  }

  // 将 GetEventListRespData 对象转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'data': data,
      'total': total,
    };
  }
}

class GetEventListResp {
  final Base? base;
  final GetEventListRespData data;

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

class GetEventUserListReq {
  final BaseListReq? baseListReq;
  final int? eventId;

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

class GetEventUserListRespData {
  final List<EventUser> data;
  final int total;

  GetEventUserListRespData({
    required this.data,
    required this.total,
  });

  // 从 JSON 构造 GetEventUserListRespData 对象
  factory GetEventUserListRespData.fromJson(Map<String, dynamic> json) {
    return GetEventUserListRespData(
      data: json['data'],
      total: json['total'],
    );
  }

  // 将 GetEventUserListRespData 对象转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'data': data,
      'total': total,
    };
  }
}

class GetEventUserListResp {
  final Base? base;
  final GetEventUserListRespData data;

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

class OnlyId {
  final Base? base;
  final int id;

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

class UpdateEventUserStatusReq {
  final int? eventId;
  final int? status;

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

class User {
  final int? id;
  final String? createdAt;
  final String? updatedAt;
  final String? username;
  final String? password;
  final String? transId;

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
