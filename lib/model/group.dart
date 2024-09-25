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

class CreateGroupInviteReq {
  final int? inviteUserId;
  final int? groupId;

  CreateGroupInviteReq({
    this.inviteUserId,
    this.groupId,
  });

  // 从 JSON 构造 CreateGroupInviteReq 对象
  factory CreateGroupInviteReq.fromJson(Map<String, dynamic> json) {
    return CreateGroupInviteReq(
      inviteUserId: json['invite_user_id'],
      groupId: json['group_id'],
    );
  }

  // 将 CreateGroupInviteReq 对象转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'invite_user_id': inviteUserId,
      'group_id': groupId,
    };
  }
}

class CreateGroupReq {
  final String? name;

  CreateGroupReq({
    this.name,
  });

  // 从 JSON 构造 CreateGroupReq 对象
  factory CreateGroupReq.fromJson(Map<String, dynamic> json) {
    return CreateGroupReq(
      name: json['name'],
    );
  }

  // 将 CreateGroupReq 对象转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
  }
}

class GetGroupInviteListReq {
  final BaseListReq? baseListReq;

  GetGroupInviteListReq({
    this.baseListReq,
  });

  // 从 JSON 构造 GetGroupInviteListReq 对象
  factory GetGroupInviteListReq.fromJson(Map<String, dynamic> json) {
    return GetGroupInviteListReq(
      baseListReq: BaseListReq.fromJson(json),
    );
  }

  // 将 GetGroupInviteListReq 对象转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      ...baseListReq?.toJson() ?? {},
    };
  }
}

class GetGroupInviteListRespData {
  final List<GroupInvite> data;
  final int total;

  GetGroupInviteListRespData({
    required this.data,
    required this.total,
  });

  // 从 JSON 构造 GetGroupInviteListRespData 对象
  factory GetGroupInviteListRespData.fromJson(Map<String, dynamic> json) {
    return GetGroupInviteListRespData(
      data: json['data'],
      total: json['total'],
    );
  }

  // 将 GetGroupInviteListRespData 对象转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'data': data,
      'total': total,
    };
  }
}

class GetGroupInviteListResp {
  final Base? base;
  final GetGroupInviteListRespData data;

  GetGroupInviteListResp({
    this.base,
    required this.data,
  });

  // 从 JSON 构造 GetGroupInviteListResp 对象
  factory GetGroupInviteListResp.fromJson(Map<String, dynamic> json) {
    return GetGroupInviteListResp(
      base: Base.fromJson(json),
      data: GetGroupInviteListRespData.fromJson(json['data']),
    );
  }

  // 将 GetGroupInviteListResp 对象转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      ...base?.toJson() ?? {},
      'data': data.toJson(),
    };
  }
}

class GetGroupUserListReq {
  final BaseListReq? baseListReq;
  final int? groupId;

  GetGroupUserListReq({
    this.baseListReq,
    this.groupId,
  });

  // 从 JSON 构造 GetGroupUserListReq 对象
  factory GetGroupUserListReq.fromJson(Map<String, dynamic> json) {
    return GetGroupUserListReq(
      baseListReq: BaseListReq.fromJson(json),
      groupId: json['group_id'],
    );
  }

  // 将 GetGroupUserListReq 对象转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      ...baseListReq?.toJson() ?? {},
      'group_id': groupId,
    };
  }
}

class GetGroupUserListRespData {
  final List<GroupUser> data;
  final int total;

  GetGroupUserListRespData({
    required this.data,
    required this.total,
  });

  // 从 JSON 构造 GetGroupUserListRespData 对象
  factory GetGroupUserListRespData.fromJson(Map<String, dynamic> json) {
    return GetGroupUserListRespData(
      data: json['data'],
      total: json['total'],
    );
  }

  // 将 GetGroupUserListRespData 对象转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'data': data,
      'total': total,
    };
  }
}

class GetGroupUserListResp {
  final Base? base;
  final GetGroupUserListRespData data;

  GetGroupUserListResp({
    this.base,
    required this.data,
  });

  // 从 JSON 构造 GetGroupUserListResp 对象
  factory GetGroupUserListResp.fromJson(Map<String, dynamic> json) {
    return GetGroupUserListResp(
      base: Base.fromJson(json),
      data: GetGroupUserListRespData.fromJson(json['data']),
    );
  }

  // 将 GetGroupUserListResp 对象转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      ...base?.toJson() ?? {},
      'data': data.toJson(),
    };
  }
}

class Group {
  final int? id;
  final String? createdAt;
  final String? updatedAt;
  final int? ownerId;
  final int? isActive;
  final String? name;
  final String? transId;
  final List<GroupUser>? groupUsers;

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
      groupUsers: json['group_users'],
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
      'group_users': groupUsers,
    };
  }
}

class GroupInvite {
  final int? id;
  final String? createdAt;
  final String? updatedAt;
  final int? invitedBy;
  final int? inviteUserId;
  final int? status;
  final String? transId;
  final int? groupId;
  final Group? group;

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
      group: json['group'],
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
      'group': group,
    };
  }
}

class GroupUser {
  final int? id;
  final String? createdAt;
  final String? updatedAt;
  final int? isActive;
  final int? groupId;
  final int? userId;
  final String? transId;
  final Group? group;
  final User? user;

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
      group: json['group'],
      user: json['user'],
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
      'group': group,
      'user': user,
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

class UpdateGroupInviteStatusReq {
  final int? groupId;
  final int? status;

  UpdateGroupInviteStatusReq({
    this.groupId,
    this.status,
  });

  // 从 JSON 构造 UpdateGroupInviteStatusReq 对象
  factory UpdateGroupInviteStatusReq.fromJson(Map<String, dynamic> json) {
    return UpdateGroupInviteStatusReq(
      groupId: json['group_id'],
      status: json['status'],
    );
  }

  // 将 UpdateGroupInviteStatusReq 对象转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'group_id': groupId,
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
