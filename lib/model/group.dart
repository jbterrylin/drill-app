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

enum CreateGroupInviteReqField {
  inviteUserId,
  groupId,
}

class CreateGroupInviteReq {
  int? inviteUserId;
  int? groupId;

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

enum CreateGroupReqField {
  name,
}

class CreateGroupReq {
  String? name;

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

enum GetGroupInviteListReqField {
  baseListReq,
}

class GetGroupInviteListReq {
  BaseListReq? baseListReq;

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

enum GetGroupInviteListRespDataField {
  data,
  total,
}

class GetGroupInviteListRespData {
  List<GroupInvite> data;
  int total;

  GetGroupInviteListRespData({
    required this.data,
    required this.total,
  });

  // 从 JSON 构造 GetGroupInviteListRespData 对象
  factory GetGroupInviteListRespData.fromJson(Map<String, dynamic> json) {
    return GetGroupInviteListRespData(
      data: json['data'] != null
          ? (json['data'] as List).map((v) => GroupInvite.fromJson(v)).toList()
          : [],
      total: json['total'],
    );
  }

  // 将 GetGroupInviteListRespData 对象转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'data': data.map((v) => v.toJson()),
      'total': total,
    };
  }
}

enum GetGroupInviteListRespField {
  base,
  data,
}

class GetGroupInviteListResp {
  Base? base;
  GetGroupInviteListRespData data;

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

enum GetGroupListReqField {
  baseListReq,
  id,
  ownerId,
  haveUserId,
  noHaveUserId,
}

class GetGroupListReq {
  BaseListReq? baseListReq;
  int? id;
  int? ownerId;
  int? haveUserId;
  int? noHaveUserId;

  GetGroupListReq({
    this.baseListReq,
    this.id,
    this.ownerId,
    this.haveUserId,
    this.noHaveUserId,
  });

  // 从 JSON 构造 GetGroupListReq 对象
  factory GetGroupListReq.fromJson(Map<String, dynamic> json) {
    return GetGroupListReq(
      baseListReq: BaseListReq.fromJson(json),
      id: json['id'],
      ownerId: json['owner_id'],
      haveUserId: json['have_user_id'],
      noHaveUserId: json['no_have_user_id'],
    );
  }

  // 将 GetGroupListReq 对象转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      ...baseListReq?.toJson() ?? {},
      'id': id,
      'owner_id': ownerId,
      'have_user_id': haveUserId,
      'no_have_user_id': noHaveUserId,
    };
  }
}

enum GetGroupListRespDataField {
  data,
  total,
}

class GetGroupListRespData {
  List<Group> data;
  int total;

  GetGroupListRespData({
    required this.data,
    required this.total,
  });

  // 从 JSON 构造 GetGroupListRespData 对象
  factory GetGroupListRespData.fromJson(Map<String, dynamic> json) {
    return GetGroupListRespData(
      data: json['data'] != null
          ? (json['data'] as List).map((v) => Group.fromJson(v)).toList()
          : [],
      total: json['total'],
    );
  }

  // 将 GetGroupListRespData 对象转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'data': data.map((v) => v.toJson()),
      'total': total,
    };
  }
}

enum GetGroupListRespField {
  base,
  data,
}

class GetGroupListResp {
  Base? base;
  GetGroupListRespData data;

  GetGroupListResp({
    this.base,
    required this.data,
  });

  // 从 JSON 构造 GetGroupListResp 对象
  factory GetGroupListResp.fromJson(Map<String, dynamic> json) {
    return GetGroupListResp(
      base: Base.fromJson(json),
      data: GetGroupListRespData.fromJson(json['data']),
    );
  }

  // 将 GetGroupListResp 对象转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      ...base?.toJson() ?? {},
      'data': data.toJson(),
    };
  }
}

enum GetGroupUserListReqField {
  baseListReq,
  groupId,
}

class GetGroupUserListReq {
  BaseListReq? baseListReq;
  int? groupId;

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

enum GetGroupUserListRespDataField {
  data,
  total,
}

class GetGroupUserListRespData {
  List<GroupUser> data;
  int total;

  GetGroupUserListRespData({
    required this.data,
    required this.total,
  });

  // 从 JSON 构造 GetGroupUserListRespData 对象
  factory GetGroupUserListRespData.fromJson(Map<String, dynamic> json) {
    return GetGroupUserListRespData(
      data: json['data'] != null
          ? (json['data'] as List).map((v) => GroupUser.fromJson(v)).toList()
          : [],
      total: json['total'],
    );
  }

  // 将 GetGroupUserListRespData 对象转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'data': data.map((v) => v.toJson()),
      'total': total,
    };
  }
}

enum GetGroupUserListRespField {
  base,
  data,
}

class GetGroupUserListResp {
  Base? base;
  GetGroupUserListRespData data;

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

enum UpdateGroupInviteStatusReqField {
  id,
  status,
}

class UpdateGroupInviteStatusReq {
  int? id;
  int? status;

  UpdateGroupInviteStatusReq({
    this.id,
    this.status,
  });

  // 从 JSON 构造 UpdateGroupInviteStatusReq 对象
  factory UpdateGroupInviteStatusReq.fromJson(Map<String, dynamic> json) {
    return UpdateGroupInviteStatusReq(
      id: json['id'],
      status: json['status'],
    );
  }

  // 将 UpdateGroupInviteStatusReq 对象转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
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
