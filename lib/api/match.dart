import 'package:drill_app/util/snack_bar/api_error.dart';
import 'package:logging/logging.dart';

import '../model/match.dart';
import '../util/http/http.dart';

class MatchApi {
  final HttpService httpService;

  MatchApi({required this.httpService});

  final log = Logger('MatchApi');
  Future<GetDrillTypeListResp?> getDrillTypeList(
      GetDrillTypeListReq input) async {
    Map<String, dynamic> data = {};
    try {
      data = await httpService.post('/v1/drill_type/list', input.toJson());
      if (data["msg"] != null && data["msg"] != "") {
        snackBarApiError(data["msg"] ?? "error");
      }
      return GetDrillTypeListResp.fromJson(data);
    } catch (e) {
      log.severe('getDrillTypeList ', e);
      snackBarApiError(data["msg"] ?? "server error");
    }
    return null;
  }

  Future<OnlyId?> createMatch(CreateMatchReq input) async {
    Map<String, dynamic> data = {};
    try {
      data = await httpService.post('/v1/match/create', input.toJson());
      if (data["msg"] != null && data["msg"] != "") {
        snackBarApiError(data["msg"] ?? "error");
      }
      return OnlyId.fromJson(data);
    } catch (e) {
      log.severe('createMatch ', e);
      snackBarApiError(data["msg"] ?? "server error");
    }
    return null;
  }

  Future<GetMatchListResp?> getMatchList(GetMatchListReq input) async {
    Map<String, dynamic> data = {};
    try {
      data = await httpService.post('/v1/match/list', input.toJson());
      if (data["msg"] != null && data["msg"] != "") {
        snackBarApiError(data["msg"] ?? "error");
      }
      return GetMatchListResp.fromJson(data);
    } catch (e) {
      log.severe('getMatchList ', e);
      snackBarApiError(data["msg"] ?? "server error");
    }
    return null;
  }

  Future<Base?> updateTeamInviteStatus(UpdateTeamInviteStatusReq input) async {
    Map<String, dynamic> data = {};
    try {
      data = await httpService.post(
          '/v1/team_invite/update/status', input.toJson());
      if (data["msg"] != null && data["msg"] != "") {
        snackBarApiError(data["msg"] ?? "error");
      }
      return Base.fromJson(data);
    } catch (e) {
      log.severe('updateTeamInviteStatus ', e);
      snackBarApiError(data["msg"] ?? "server error");
    }
    return null;
  }

  Future<OnlyId?> createGame(CreateGameReq input) async {
    Map<String, dynamic> data = {};
    try {
      data = await httpService.post('/v1/game/create', input.toJson());
      if (data["msg"] != null && data["msg"] != "") {
        snackBarApiError(data["msg"] ?? "error");
      }
      return OnlyId.fromJson(data);
    } catch (e) {
      log.severe('createGame ', e);
      snackBarApiError(data["msg"] ?? "server error");
    }
    return null;
  }

  Future<Base?> updateGameTeamResultScore(
      UpdateGameTeamResultScoreReq input) async {
    Map<String, dynamic> data = {};
    try {
      data = await httpService.post(
          '/v1/game_team_result/update/score', input.toJson());
      if (data["msg"] != null && data["msg"] != "") {
        snackBarApiError(data["msg"] ?? "error");
      }
      return Base.fromJson(data);
    } catch (e) {
      log.severe('updateGameTeamResultScore ', e);
      snackBarApiError(data["msg"] ?? "server error");
    }
    return null;
  }
}
