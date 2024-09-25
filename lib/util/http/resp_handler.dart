import 'package:drill_app/util/http/http.dart';
import 'package:drill_app/util/snack_bar/api_error.dart';
import 'package:logging/logging.dart';

Future<T?> respHandler<T>(
    HttpService httpService,
    String endpoint,
    Map<String, dynamic> reqBody,
    T Function(Map<String, dynamic>) fromJson,
    Logger log,
  ) async {    
    Map<String, dynamic> data = {};

    try {
      data = await httpService.post(endpoint, reqBody);
      if (data["msg"] != null && data["msg"] != "") {
        snackBarApiError(data["msg"] ?? "error");
      }
      return fromJson(data);
    } catch (e) {
      log.severe('Error during request to $endpoint, req: $reqBody, resp: $data', e);
      snackBarApiError(data["msg"] ?? "server error");
      return null;
    }
  }