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

enum CreateGameReqField {
  matchId,
}

class CreateGameReq {
  int? matchId;

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

enum CreateMatchReqField {
  eventId,
  drillTypeConfigId,
  startAt,
  endAt,
  teams,
}

class CreateMatchReq {
  int? eventId;
  int? drillTypeConfigId;
  String? startAt;
  String? endAt;
  List<CreateMatchReqTeam>? teams;

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
      teams: json['teams'] != null
          ? (json['teams'] as List)
              .map((v) => CreateMatchReqTeam.fromJson(v))
              .toList()
          : null,
    );
  }

  // 将 CreateMatchReq 对象转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'event_id': eventId,
      'drill_type_config_id': drillTypeConfigId,
      'start_at': startAt,
      'end_at': endAt,
      'teams': teams?.map((v) => v.toJson()),
    };
  }
}

enum CreateMatchReqTeamField {
  sortOrder,
  teamUsers,
}

class CreateMatchReqTeam {
  int? sortOrder;
  List<CreateMatchReqTeamUser>? teamUsers;

  CreateMatchReqTeam({
    this.sortOrder,
    this.teamUsers,
  });

  // 从 JSON 构造 CreateMatchReqTeam 对象
  factory CreateMatchReqTeam.fromJson(Map<String, dynamic> json) {
    return CreateMatchReqTeam(
      sortOrder: json['sort_order'],
      teamUsers: json['team_users'] != null
          ? (json['team_users'] as List)
              .map((v) => CreateMatchReqTeamUser.fromJson(v))
              .toList()
          : null,
    );
  }

  // 将 CreateMatchReqTeam 对象转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'sort_order': sortOrder,
      'team_users': teamUsers?.map((v) => v.toJson()),
    };
  }
}

enum CreateMatchReqTeamUserField {
  userId,
  sortOrder,
}

class CreateMatchReqTeamUser {
  int? userId;
  int? sortOrder;

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

enum DrillTypeField {
  id,
  createdAt,
  updatedAt,
  name,
  transId,
  drillTypeConfigs,
}

class DrillType {
  int? id;
  String? createdAt;
  String? updatedAt;
  String? name;
  String? transId;
  List<DrillTypeConfig>? drillTypeConfigs;

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
      drillTypeConfigs: json['drill_type_configs'] != null
          ? (json['drill_type_configs'] as List)
              .map((v) => DrillTypeConfig.fromJson(v))
              .toList()
          : null,
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
      'drill_type_configs': drillTypeConfigs?.map((v) => v.toJson()),
    };
  }
}

enum DrillTypeConfigField {
  id,
  createdAt,
  updatedAt,
  drillTypeId,
  teamCount,
  teamUserCount,
  winGameCount,
  winScoreCount,
  drillType,
}

class DrillTypeConfig {
  int? id;
  String? createdAt;
  String? updatedAt;
  int? drillTypeId;
  int? teamCount;
  int? teamUserCount;
  int? winGameCount;
  int? winScoreCount;
  DrillType? drillType;

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
      drillType: json['drill_type'] != null
          ? DrillType?.fromJson(json['drill_type'])
          : null,
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
      'drill_type': drillType?.toJson(),
    };
  }
}

enum GameField {
  id,
  createdAt,
  updatedAt,
  matchId,
  sortOrder,
  transId,
  match,
  gameTeamResults,
}

class Game {
  int? id;
  String? createdAt;
  String? updatedAt;
  int? matchId;
  int? sortOrder;
  String? transId;
  Match? match;
  List<GameTeamResult>? gameTeamResults;

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
      match: json['match'] != null ? Match?.fromJson(json['match']) : null,
      gameTeamResults: json['game_team_results'] != null
          ? (json['game_team_results'] as List)
              .map((v) => GameTeamResult.fromJson(v))
              .toList()
          : null,
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
      'match': match?.toJson(),
      'game_team_results': gameTeamResults?.map((v) => v.toJson()),
    };
  }
}

enum GameTeamResultField {
  id,
  createdAt,
  updatedAt,
  gameId,
  teamId,
  score,
  transId,
  result,
  game,
}

class GameTeamResult {
  int? id;
  String? createdAt;
  String? updatedAt;
  int? gameId;
  int? teamId;
  int? score;
  String? transId;
  int? result;
  Game? game;

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
      game: json['game'] != null ? Game?.fromJson(json['game']) : null,
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
      'game': game?.toJson(),
    };
  }
}

// enum GetDrillTypeListReqField {
// }

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

enum GetDrillTypeListRespDataField {
  data,
  total,
}

class GetDrillTypeListRespData {
  List<DrillType> data;
  int total;

  GetDrillTypeListRespData({
    required this.data,
    required this.total,
  });

  // 从 JSON 构造 GetDrillTypeListRespData 对象
  factory GetDrillTypeListRespData.fromJson(Map<String, dynamic> json) {
    return GetDrillTypeListRespData(
      data: json['data'] != null
          ? (json['data'] as List).map((v) => DrillType.fromJson(v)).toList()
          : [],
      total: json['total'],
    );
  }

  // 将 GetDrillTypeListRespData 对象转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'data': data.map((v) => v.toJson()),
      'total': total,
    };
  }
}

enum GetDrillTypeListRespField {
  base,
  data,
}

class GetDrillTypeListResp {
  Base? base;
  GetDrillTypeListRespData data;

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

enum GetMatchListReqField {
  baseListReq,
  eventId,
}

class GetMatchListReq {
  BaseListReq? baseListReq;
  int? eventId;

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

enum GetMatchListRespDataField {
  data,
  total,
}

class GetMatchListRespData {
  List<Match> data;
  int total;

  GetMatchListRespData({
    required this.data,
    required this.total,
  });

  // 从 JSON 构造 GetMatchListRespData 对象
  factory GetMatchListRespData.fromJson(Map<String, dynamic> json) {
    return GetMatchListRespData(
      data: json['data'] != null
          ? (json['data'] as List).map((v) => Match.fromJson(v)).toList()
          : [],
      total: json['total'],
    );
  }

  // 将 GetMatchListRespData 对象转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'data': data.map((v) => v.toJson()),
      'total': total,
    };
  }
}

enum GetMatchListRespField {
  base,
  data,
}

class GetMatchListResp {
  Base? base;
  GetMatchListRespData data;

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

enum MatchField {
  id,
  createdAt,
  updatedAt,
  eventId,
  drillTypeConfigId,
  startAt,
  endAt,
  transId,
  drillTypeConfig,
  games,
  teams,
  matchTeamResults,
}

class Match {
  int? id;
  String? createdAt;
  String? updatedAt;
  int? eventId;
  int? drillTypeConfigId;
  String? startAt;
  String? endAt;
  String? transId;
  DrillTypeConfig? drillTypeConfig;
  List<Game>? games;
  List<Team>? teams;
  List<MatchTeamResult>? matchTeamResults;

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
      drillTypeConfig: json['drill_type_config'] != null
          ? DrillTypeConfig?.fromJson(json['drill_type_config'])
          : null,
      games: json['games'] != null
          ? (json['games'] as List).map((v) => Game.fromJson(v)).toList()
          : null,
      teams: json['teams'] != null
          ? (json['teams'] as List).map((v) => Team.fromJson(v)).toList()
          : null,
      matchTeamResults: json['match_team_results'] != null
          ? (json['match_team_results'] as List)
              .map((v) => MatchTeamResult.fromJson(v))
              .toList()
          : null,
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
      'drill_type_config': drillTypeConfig?.toJson(),
      'games': games?.map((v) => v.toJson()),
      'teams': teams?.map((v) => v.toJson()),
      'match_team_results': matchTeamResults?.map((v) => v.toJson()),
    };
  }
}

enum MatchTeamResultField {
  id,
  createdAt,
  updatedAt,
  matchId,
  teamId,
  transId,
  result,
  match,
  team,
}

class MatchTeamResult {
  int? id;
  String? createdAt;
  String? updatedAt;
  int? matchId;
  int? teamId;
  String? transId;
  int? result;
  Match? match;
  Team? team;

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
      match: json['match'] != null ? Match?.fromJson(json['match']) : null,
      team: json['team'] != null ? Team?.fromJson(json['team']) : null,
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
      'match': match?.toJson(),
      'team': team?.toJson(),
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

enum TeamField {
  id,
  createdAt,
  updatedAt,
  matchId,
  sortOrder,
  transId,
  result,
  teamUsers,
  gameTeamResults,
}

class Team {
  int? id;
  String? createdAt;
  String? updatedAt;
  int? matchId;
  int? sortOrder;
  String? transId;
  int? result;
  List<TeamUser>? teamUsers;
  List<GameTeamResult>? gameTeamResults;

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
      teamUsers: json['team_users'] != null
          ? (json['team_users'] as List)
              .map((v) => TeamUser.fromJson(v))
              .toList()
          : null,
      gameTeamResults: json['game_team_results'] != null
          ? (json['game_team_results'] as List)
              .map((v) => GameTeamResult.fromJson(v))
              .toList()
          : null,
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
      'team_users': teamUsers?.map((v) => v.toJson()),
      'game_team_results': gameTeamResults?.map((v) => v.toJson()),
    };
  }
}

enum TeamInviteField {
  id,
  createdAt,
  updatedAt,
  teamId,
  userId,
  status,
  transId,
  teams,
}

class TeamInvite {
  int? id;
  String? createdAt;
  String? updatedAt;
  int? teamId;
  int? userId;
  int? status;
  String? transId;
  List<Team>? teams;

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
      teams: json['teams'] != null
          ? (json['teams'] as List).map((v) => Team.fromJson(v)).toList()
          : null,
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
      'teams': teams?.map((v) => v.toJson()),
    };
  }
}

enum TeamUserField {
  id,
  createdAt,
  updatedAt,
  teamId,
  userId,
  sortOrder,
  transId,
  user,
}

class TeamUser {
  int? id;
  String? createdAt;
  String? updatedAt;
  int? teamId;
  int? userId;
  int? sortOrder;
  String? transId;
  User? user;

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
      user: json['user'] != null ? User?.fromJson(json['user']) : null,
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
      'user': user?.toJson(),
    };
  }
}

enum UpdateGameTeamResultScoreReqField {
  gameId,
  teamId,
  score,
  type,
}

class UpdateGameTeamResultScoreReq {
  int? gameId;
  int? teamId;
  int? score;
  int? type;

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

enum UpdateTeamInviteStatusReqField {
  teamId,
  userId,
  status,
}

class UpdateTeamInviteStatusReq {
  int? teamId;
  int? userId;
  int? status;

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
