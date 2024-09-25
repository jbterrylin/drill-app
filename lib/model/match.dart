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

class CreateGameReq {
  final int? matchId;

  CreateGameReq({
    this.matchId,
  });

  // 从 JSON 构造 CreateGameReq 对象
  factory CreateGameReq.fromJson(Map<String, dynamic> json) {
    return CreateGameReq(
      matchId: json['match_id'],
    );
  }

  // 将 CreateGameReq 对象转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'match_id': matchId,
    };
  }
}

class CreateMatchReq {
  final int? eventId;
  final int? drillTypeConfigId;
  final String? startAt;
  final String? endAt;
  final List<CreateMatchReqTeam>? teams;

  CreateMatchReq({
    this.eventId,
    this.drillTypeConfigId,
    this.startAt,
    this.endAt,
    this.teams,
  });

  // 从 JSON 构造 CreateMatchReq 对象
  factory CreateMatchReq.fromJson(Map<String, dynamic> json) {
    return CreateMatchReq(
      eventId: json['event_id'],
      drillTypeConfigId: json['drill_type_config_id'],
      startAt: json['start_at'],
      endAt: json['end_at'],
      teams: json['teams'],
    );
  }

  // 将 CreateMatchReq 对象转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'event_id': eventId,
      'drill_type_config_id': drillTypeConfigId,
      'start_at': startAt,
      'end_at': endAt,
      'teams': teams,
    };
  }
}

class CreateMatchReqTeam {
  final int? sortOrder;
  final List<CreateMatchReqTeamUser>? teamUsers;

  CreateMatchReqTeam({
    this.sortOrder,
    this.teamUsers,
  });

  // 从 JSON 构造 CreateMatchReqTeam 对象
  factory CreateMatchReqTeam.fromJson(Map<String, dynamic> json) {
    return CreateMatchReqTeam(
      sortOrder: json['sort_order'],
      teamUsers: json['team_users'],
    );
  }

  // 将 CreateMatchReqTeam 对象转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'sort_order': sortOrder,
      'team_users': teamUsers,
    };
  }
}

class CreateMatchReqTeamUser {
  final int? userId;
  final int? sortOrder;

  CreateMatchReqTeamUser({
    this.userId,
    this.sortOrder,
  });

  // 从 JSON 构造 CreateMatchReqTeamUser 对象
  factory CreateMatchReqTeamUser.fromJson(Map<String, dynamic> json) {
    return CreateMatchReqTeamUser(
      userId: json['user_id'],
      sortOrder: json['sort_order'],
    );
  }

  // 将 CreateMatchReqTeamUser 对象转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'sort_order': sortOrder,
    };
  }
}

class DrillType {
  final int? id;
  final String? createdAt;
  final String? updatedAt;
  final String? name;
  final String? transId;
  final List<DrillTypeConfig>? drillTypeConfigs;

  DrillType({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.transId,
    this.drillTypeConfigs,
  });

  // 从 JSON 构造 DrillType 对象
  factory DrillType.fromJson(Map<String, dynamic> json) {
    return DrillType(
      id: json['id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      name: json['name'],
      transId: json['trans_id'],
      drillTypeConfigs: json['drill_type_configs'],
    );
  }

  // 将 DrillType 对象转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'name': name,
      'trans_id': transId,
      'drill_type_configs': drillTypeConfigs,
    };
  }
}

class DrillTypeConfig {
  final int? id;
  final String? createdAt;
  final String? updatedAt;
  final int? drillTypeId;
  final int? teamCount;
  final int? teamUserCount;
  final int? winGameCount;
  final int? winScoreCount;
  final DrillType? drillType;

  DrillTypeConfig({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.drillTypeId,
    this.teamCount,
    this.teamUserCount,
    this.winGameCount,
    this.winScoreCount,
    this.drillType,
  });

  // 从 JSON 构造 DrillTypeConfig 对象
  factory DrillTypeConfig.fromJson(Map<String, dynamic> json) {
    return DrillTypeConfig(
      id: json['id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      drillTypeId: json['drill_type_id'],
      teamCount: json['team_count'],
      teamUserCount: json['team_user_count'],
      winGameCount: json['win_game_count'],
      winScoreCount: json['win_score_count'],
      drillType: json['drill_type'],
    );
  }

  // 将 DrillTypeConfig 对象转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'drill_type_id': drillTypeId,
      'team_count': teamCount,
      'team_user_count': teamUserCount,
      'win_game_count': winGameCount,
      'win_score_count': winScoreCount,
      'drill_type': drillType,
    };
  }
}

class Game {
  final int? id;
  final String? createdAt;
  final String? updatedAt;
  final int? matchId;
  final int? sortOrder;
  final String? transId;
  final Match? match;
  final List<GameTeamResult>? gameTeamResults;

  Game({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.matchId,
    this.sortOrder,
    this.transId,
    this.match,
    this.gameTeamResults,
  });

  // 从 JSON 构造 Game 对象
  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      id: json['id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      matchId: json['match_id'],
      sortOrder: json['sort_order'],
      transId: json['trans_id'],
      match: json['match'],
      gameTeamResults: json['game_team_results'],
    );
  }

  // 将 Game 对象转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'match_id': matchId,
      'sort_order': sortOrder,
      'trans_id': transId,
      'match': match,
      'game_team_results': gameTeamResults,
    };
  }
}

class GameTeamResult {
  final int? id;
  final String? createdAt;
  final String? updatedAt;
  final int? gameId;
  final int? teamId;
  final int? score;
  final String? transId;
  final int? result;
  final Game? game;

  GameTeamResult({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.gameId,
    this.teamId,
    this.score,
    this.transId,
    this.result,
    this.game,
  });

  // 从 JSON 构造 GameTeamResult 对象
  factory GameTeamResult.fromJson(Map<String, dynamic> json) {
    return GameTeamResult(
      id: json['id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      gameId: json['game_id'],
      teamId: json['team_id'],
      score: json['score'],
      transId: json['trans_id'],
      result: json['result'],
      game: json['game'],
    );
  }

  // 将 GameTeamResult 对象转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'game_id': gameId,
      'team_id': teamId,
      'score': score,
      'trans_id': transId,
      'result': result,
      'game': game,
    };
  }
}

class GetDrillTypeListReq {
  GetDrillTypeListReq();

  // 从 JSON 构造 GetDrillTypeListReq 对象
  factory GetDrillTypeListReq.fromJson(Map<String, dynamic> json) {
    return GetDrillTypeListReq();
  }

  // 将 GetDrillTypeListReq 对象转换为 JSON
  Map<String, dynamic> toJson() {
    return {};
  }
}

class GetDrillTypeListRespData {
  final List<DrillType> data;
  final int total;

  GetDrillTypeListRespData({
    required this.data,
    required this.total,
  });

  // 从 JSON 构造 GetDrillTypeListRespData 对象
  factory GetDrillTypeListRespData.fromJson(Map<String, dynamic> json) {
    return GetDrillTypeListRespData(
      data: json['data'],
      total: json['total'],
    );
  }

  // 将 GetDrillTypeListRespData 对象转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'data': data,
      'total': total,
    };
  }
}

class GetDrillTypeListResp {
  final Base? base;
  final GetDrillTypeListRespData data;

  GetDrillTypeListResp({
    this.base,
    required this.data,
  });

  // 从 JSON 构造 GetDrillTypeListResp 对象
  factory GetDrillTypeListResp.fromJson(Map<String, dynamic> json) {
    return GetDrillTypeListResp(
      base: Base.fromJson(json),
      data: GetDrillTypeListRespData.fromJson(json['data']),
    );
  }

  // 将 GetDrillTypeListResp 对象转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      ...base?.toJson() ?? {},
      'data': data.toJson(),
    };
  }
}

class GetMatchListReq {
  final BaseListReq? baseListReq;
  final int? eventId;

  GetMatchListReq({
    this.baseListReq,
    this.eventId,
  });

  // 从 JSON 构造 GetMatchListReq 对象
  factory GetMatchListReq.fromJson(Map<String, dynamic> json) {
    return GetMatchListReq(
      baseListReq: BaseListReq.fromJson(json),
      eventId: json['event_id'],
    );
  }

  // 将 GetMatchListReq 对象转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      ...baseListReq?.toJson() ?? {},
      'event_id': eventId,
    };
  }
}

class GetMatchListRespData {
  final List<Match> data;
  final int total;

  GetMatchListRespData({
    required this.data,
    required this.total,
  });

  // 从 JSON 构造 GetMatchListRespData 对象
  factory GetMatchListRespData.fromJson(Map<String, dynamic> json) {
    return GetMatchListRespData(
      data: json['data'],
      total: json['total'],
    );
  }

  // 将 GetMatchListRespData 对象转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'data': data,
      'total': total,
    };
  }
}

class GetMatchListResp {
  final Base? base;
  final GetMatchListRespData data;

  GetMatchListResp({
    this.base,
    required this.data,
  });

  // 从 JSON 构造 GetMatchListResp 对象
  factory GetMatchListResp.fromJson(Map<String, dynamic> json) {
    return GetMatchListResp(
      base: Base.fromJson(json),
      data: GetMatchListRespData.fromJson(json['data']),
    );
  }

  // 将 GetMatchListResp 对象转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      ...base?.toJson() ?? {},
      'data': data.toJson(),
    };
  }
}

class Match {
  final int? id;
  final String? createdAt;
  final String? updatedAt;
  final int? eventId;
  final int? drillTypeConfigId;
  final String? startAt;
  final String? endAt;
  final String? transId;
  final DrillTypeConfig? drillTypeConfig;
  final List<Game>? games;
  final List<Team>? teams;
  final List<MatchTeamResult>? matchTeamResults;

  Match({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.eventId,
    this.drillTypeConfigId,
    this.startAt,
    this.endAt,
    this.transId,
    this.drillTypeConfig,
    this.games,
    this.teams,
    this.matchTeamResults,
  });

  // 从 JSON 构造 Match 对象
  factory Match.fromJson(Map<String, dynamic> json) {
    return Match(
      id: json['id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      eventId: json['event_id'],
      drillTypeConfigId: json['drill_type_config_id'],
      startAt: json['start_at'],
      endAt: json['end_at'],
      transId: json['trans_id'],
      drillTypeConfig: json['drill_type_config'],
      games: json['games'],
      teams: json['teams'],
      matchTeamResults: json['match_team_results'],
    );
  }

  // 将 Match 对象转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'event_id': eventId,
      'drill_type_config_id': drillTypeConfigId,
      'start_at': startAt,
      'end_at': endAt,
      'trans_id': transId,
      'drill_type_config': drillTypeConfig,
      'games': games,
      'teams': teams,
      'match_team_results': matchTeamResults,
    };
  }
}

class MatchTeamResult {
  final int? id;
  final String? createdAt;
  final String? updatedAt;
  final int? matchId;
  final int? teamId;
  final String? transId;
  final int? result;
  final Match? match;
  final Team? team;

  MatchTeamResult({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.matchId,
    this.teamId,
    this.transId,
    this.result,
    this.match,
    this.team,
  });

  // 从 JSON 构造 MatchTeamResult 对象
  factory MatchTeamResult.fromJson(Map<String, dynamic> json) {
    return MatchTeamResult(
      id: json['id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      matchId: json['match_id'],
      teamId: json['team_id'],
      transId: json['trans_id'],
      result: json['result'],
      match: json['match'],
      team: json['team'],
    );
  }

  // 将 MatchTeamResult 对象转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'match_id': matchId,
      'team_id': teamId,
      'trans_id': transId,
      'result': result,
      'match': match,
      'team': team,
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

class Team {
  final int? id;
  final String? createdAt;
  final String? updatedAt;
  final int? matchId;
  final int? sortOrder;
  final String? transId;
  final int? result;
  final List<TeamUser>? teamUsers;
  final List<GameTeamResult>? gameTeamResults;

  Team({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.matchId,
    this.sortOrder,
    this.transId,
    this.result,
    this.teamUsers,
    this.gameTeamResults,
  });

  // 从 JSON 构造 Team 对象
  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      id: json['id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      matchId: json['match_id'],
      sortOrder: json['sort_order'],
      transId: json['trans_id'],
      result: json['result'],
      teamUsers: json['team_users'],
      gameTeamResults: json['game_team_results'],
    );
  }

  // 将 Team 对象转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'match_id': matchId,
      'sort_order': sortOrder,
      'trans_id': transId,
      'result': result,
      'team_users': teamUsers,
      'game_team_results': gameTeamResults,
    };
  }
}

class TeamInvite {
  final int? id;
  final String? createdAt;
  final String? updatedAt;
  final int? teamId;
  final int? userId;
  final int? status;
  final String? transId;
  final List<Team>? teams;

  TeamInvite({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.teamId,
    this.userId,
    this.status,
    this.transId,
    this.teams,
  });

  // 从 JSON 构造 TeamInvite 对象
  factory TeamInvite.fromJson(Map<String, dynamic> json) {
    return TeamInvite(
      id: json['id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      teamId: json['team_id'],
      userId: json['user_id'],
      status: json['status'],
      transId: json['trans_id'],
      teams: json['teams'],
    );
  }

  // 将 TeamInvite 对象转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'team_id': teamId,
      'user_id': userId,
      'status': status,
      'trans_id': transId,
      'teams': teams,
    };
  }
}

class TeamUser {
  final int? id;
  final String? createdAt;
  final String? updatedAt;
  final int? teamId;
  final int? userId;
  final int? sortOrder;
  final String? transId;
  final User? user;

  TeamUser({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.teamId,
    this.userId,
    this.sortOrder,
    this.transId,
    this.user,
  });

  // 从 JSON 构造 TeamUser 对象
  factory TeamUser.fromJson(Map<String, dynamic> json) {
    return TeamUser(
      id: json['id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      teamId: json['team_id'],
      userId: json['user_id'],
      sortOrder: json['sort_order'],
      transId: json['trans_id'],
      user: json['user'],
    );
  }

  // 将 TeamUser 对象转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'team_id': teamId,
      'user_id': userId,
      'sort_order': sortOrder,
      'trans_id': transId,
      'user': user,
    };
  }
}

class UpdateGameTeamResultScoreReq {
  final int? gameId;
  final int? teamId;
  final int? score;
  final int? type;

  UpdateGameTeamResultScoreReq({
    this.gameId,
    this.teamId,
    this.score,
    this.type,
  });

  // 从 JSON 构造 UpdateGameTeamResultScoreReq 对象
  factory UpdateGameTeamResultScoreReq.fromJson(Map<String, dynamic> json) {
    return UpdateGameTeamResultScoreReq(
      gameId: json['game_id'],
      teamId: json['team_id'],
      score: json['score'],
      type: json['type'],
    );
  }

  // 将 UpdateGameTeamResultScoreReq 对象转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'game_id': gameId,
      'team_id': teamId,
      'score': score,
      'type': type,
    };
  }
}

class UpdateTeamInviteStatusReq {
  final int? teamId;
  final int? userId;
  final int? status;

  UpdateTeamInviteStatusReq({
    this.teamId,
    this.userId,
    this.status,
  });

  // 从 JSON 构造 UpdateTeamInviteStatusReq 对象
  factory UpdateTeamInviteStatusReq.fromJson(Map<String, dynamic> json) {
    return UpdateTeamInviteStatusReq(
      teamId: json['team_id'],
      userId: json['user_id'],
      status: json['status'],
    );
  }

  // 将 UpdateTeamInviteStatusReq 对象转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'team_id': teamId,
      'user_id': userId,
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
