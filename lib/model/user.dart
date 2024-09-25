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

class CreateUserReq {
  final String? username;
  final String? password;

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

class CreateUserResp {
  final Base? base;
  final Token? data;

  CreateUserResp({
    this.base,
    required this.data,
  });

  // 从 JSON 构造 CreateUserResp 对象
  factory CreateUserResp.fromJson(Map<String, dynamic> json) {
    return CreateUserResp(
      base: Base.fromJson(json),
      data: json['data'],
    );
  }

  // 将 CreateUserResp 对象转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      ...base?.toJson() ?? {},
      'data': data,
    };
  }
}

class LoginReq {
  final String? username;
  final String? password;

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

class LoginResp {
  final Base? base;
  final Token? data;

  LoginResp({
    this.base,
    required this.data,
  });

  // 从 JSON 构造 LoginResp 对象
  factory LoginResp.fromJson(Map<String, dynamic> json) {
    return LoginResp(
      base: Base.fromJson(json),
      data: json['data'],
    );
  }

  // 将 LoginResp 对象转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      ...base?.toJson() ?? {},
      'data': data,
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

class Token {
  final String? token;
  final int? expired;

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

class UserResp {
  final Base? base;
  final User? data;

  UserResp({
    this.base,
    required this.data,
  });

  // 从 JSON 构造 UserResp 对象
  factory UserResp.fromJson(Map<String, dynamic> json) {
    return UserResp(
      base: Base.fromJson(json),
      data: json['data'],
    );
  }

  // 将 UserResp 对象转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      ...base?.toJson() ?? {},
      'data': data,
    };
  }
}
