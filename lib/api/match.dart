import '../model/match.dart';
import '../util/http/http.dart';

class MatchApi {
  final HttpService httpService;
  final String baseUrl;

  MatchApi({required this.httpService, required this.baseUrl});
  Future<GetDrillTypeListResp?> getDrillTypeList(
      GetDrillTypeListReq input) async {
    final data =
        await httpService.post('$baseUrl/v1/drill_type/list', input.toJson());
    return GetDrillTypeListResp.fromJson(data);
  }

  Future<OnlyId?> createMatch(CreateMatchReq input) async {
    final data =
        await httpService.post('$baseUrl/v1/match/create', input.toJson());
    return OnlyId.fromJson(data);
  }

  Future<GetMatchListResp?> getMatchList(GetMatchListReq input) async {
    final data =
        await httpService.post('$baseUrl/v1/match/list', input.toJson());
    return GetMatchListResp.fromJson(data);
  }

  Future<Base?> updateTeamInviteStatus(UpdateTeamInviteStatusReq input) async {
    final data = await httpService.post(
        '$baseUrl/v1/team_invite/update/status', input.toJson());
    return Base.fromJson(data);
  }

  Future<OnlyId?> createGame(CreateGameReq input) async {
    final data =
        await httpService.post('$baseUrl/v1/game/create', input.toJson());
    return OnlyId.fromJson(data);
  }

  Future<Base?> updateGameTeamResultScore(
      UpdateGameTeamResultScoreReq input) async {
    final data = await httpService.post(
        '$baseUrl/v1/game_team_result/update/score', input.toJson());
    return Base.fromJson(data);
  }
}
