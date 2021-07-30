import 'dart:convert' as convert;

import 'package:cat_test_app/app/utils/storage_util.dart';
import 'package:http/http.dart' as http;

class HttpClient extends http.BaseClient{
  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    // intercept each call and add the Authorization header if token is available
    final authToken = StorageUtil.getString("token");

    if(authToken!=null)
      request.headers.putIfAbsent('Authorization', () => 'Bearer ' + authToken);
    request.headers.putIfAbsent('Content-Type', () => 'application/json');

    return request.send();
  }
  @override
  Future<http.Response> get(Uri url, {Map<String, String>? headers}) async {
    var response = await super.get(url);
    return response;
  }
  @override
  Future<http.Response> post(Uri url,
      {Object? body,
        convert.Encoding? encoding,
        Map<String, String>? headers}) async {
    var response = await super.post(url, body: body, headers: headers);
    return response;
  }

  dynamic decodeBodyBytesToJSON(http.Response response) {
    if (response.body.isNotEmpty) {
      return convert.json.decode(convert.utf8.decode(response.bodyBytes));
    }
  }
}

HttpClient httpClient = HttpClient();

Future<dynamic> get(Uri url) async {
  try {
    final response = await httpClient.get(url);
    return httpClient.decodeBodyBytesToJSON(response);
  } catch (err) {
    print(err);
  }
}
Future<dynamic> post(Uri url, dynamic payload, {Map<String, String>? headers}) async {
  try {
    final response = await httpClient.post(url, body: payload, headers: headers);
    print(response.body);
    print(response.statusCode);
    try {
      return {
        'body': httpClient.decodeBodyBytesToJSON(response),
        'statusCode': response.statusCode
      };
    }
    catch(err){
      print(err);
      return {'statusCode': response.statusCode};
    }
  } catch (err) {
    print("POST_REQUEST: $err");
  }
}