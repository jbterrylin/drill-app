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

enum CreateUserReqField {
  username,
  password,
}

class CreateUserReq {
  String? username;
  String? password;

  CreateUserReq({
    this.username,
    this.password,
  });

  // 从 JSON 构造 CreateUserReq 对象
  factory CreateUserReq.fromJson(Map<String, dynamic> json) {
    return CreateUserReq(
      username: json['username'],
      password: json['password'],
    );
  }

  // 将 CreateUserReq 对象转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
    };
  }
}

enum CreateUserRespField {
  base,
  data,
}

class CreateUserResp {
  Base? base;
  Token? data;

  CreateUserResp({
    this.base,
    this.data,
  });

  // 从 JSON 构造 CreateUserResp 对象
  factory CreateUserResp.fromJson(Map<String, dynamic> json) {
    return CreateUserResp(
      base: Base.fromJson(json),
      data: json['data'] != null ? Token?.fromJson(json['data']) : null,
    );
  }

  // 将 CreateUserResp 对象转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      ...base?.toJson() ?? {},
      'data': data?.toJson(),
    };
  }
}

enum LoginReqField {
  username,
  password,
}

class LoginReq {
  String? username;
  String? password;

  LoginReq({
    this.username,
    this.password,
  });

  // 从 JSON 构造 LoginReq 对象
  factory LoginReq.fromJson(Map<String, dynamic> json) {
    return LoginReq(
      username: json['username'],
      password: json['password'],
    );
  }

  // 将 LoginReq 对象转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
    };
  }
}

enum LoginRespField {
  base,
  data,
}

class LoginResp {
  Base? base;
  Token? data;

  LoginResp({
    this.base,
    this.data,
  });

  // 从 JSON 构造 LoginResp 对象
  factory LoginResp.fromJson(Map<String, dynamic> json) {
    return LoginResp(
      base: Base.fromJson(json),
      data: json['data'] != null ? Token?.fromJson(json['data']) : null,
    );
  }

  // 将 LoginResp 对象转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      ...base?.toJson() ?? {},
      'data': data?.toJson(),
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

enum TokenField {
  token,
  expired,
}

class Token {
  String? token;
  int? expired;

  Token({
    this.token,
    this.expired,
  });

  // 从 JSON 构造 Token 对象
  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
      token: json['token'],
      expired: json['expired'],
    );
  }

  // 将 Token 对象转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'expired': expired,
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

enum UserRespField {
  base,
  data,
}

class UserResp {
  Base? base;
  User? data;

  UserResp({
    this.base,
    this.data,
  });

  // 从 JSON 构造 UserResp 对象
  factory UserResp.fromJson(Map<String, dynamic> json) {
    return UserResp(
      base: Base.fromJson(json),
      data: json['data'] != null ? User?.fromJson(json['data']) : null,
    );
  }

  // 将 UserResp 对象转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      ...base?.toJson() ?? {},
      'data': data?.toJson(),
    };
  }
}
