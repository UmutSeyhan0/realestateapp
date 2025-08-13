import 'dart:convert';
import 'package:http/http.dart' as https;

import '../base/ibase_model.dart';
import '../enums/methods_enum.dart';
//import 'package:itp_support/core/base/ibase_model.dart';
//import 'package:itp_support/core/enums/methods_enum.dart';

class NetworkService {
  static NetworkService get instance => _instance;
  static final NetworkService _instance = NetworkService._init();
  //      'Content-Type': 'application/x-www-form-urlencoded', ise jsonEncode yazılmayacak application/json ise encode yapılacak!

  NetworkService._init();

  Future<dynamic> http<T extends IBaseModel>(
    String path,
    IBaseModel model,
    Methods method, {
    Object? body,
    Map<String, dynamic>? queryParameters,
    String? baseUrl,
  }) async {
    var url = Uri.parse("${baseUrl ?? "https://defaultbaseurl.com"}$path");

    print("Request URL -> $url");

    var headers = {'Content-Type': 'application/json'};

    https.Response? response;

    try {
      switch (method) {
        case Methods.get:
          response = await https.get(url, headers: headers);
          break;
        case Methods.post:
          response = await https.post(
            url,
            headers: headers,
            body: jsonEncode(body),
          );
          break;
        case Methods.put:
          response = await https.put(
            url,
            headers: headers,
            body: jsonEncode(body),
          );
          break;
        case Methods.delete:
          response = await https.delete(
            url,
            headers: headers,
            body: body != null ? jsonEncode(body) : null,
          );
          break;
        default:
          throw Exception("Unsupported HTTP method");
      }

      if (response.statusCode == 200) {
        return jsonBodyParser<T>(model, response.body);
      } else {
        print("Error: ${response.statusCode} -> ${response.body}");
        return null;
      }
    } catch (e) {
      print("Request failed: $e");
      return null;
    }
  }

  dynamic jsonBodyParser<T extends IBaseModel>(IBaseModel model, String body) {
    final dynamic jsonBody = jsonDecode(body);

    if (jsonBody is List) {
      return jsonBody.map((item) => model.fromJson(item)).toList();
    } else if (jsonBody is Map<String, dynamic>) {
      if (jsonBody.containsKey('results') && jsonBody['results'] is List) {
        final results = jsonBody['results'] as List;
        return results.map((item) => model.fromJson(item)).toList();
      }
      return model.fromJson(jsonBody);
    }

    return null;
  }
}
