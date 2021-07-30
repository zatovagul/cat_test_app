Uri pathBulderAPI(String endpoint,[Map<String, dynamic>? queryParameters]) {
  String url = "mobile-test.itfox-web.com";
  return Uri.http(url, endpoint, queryParameters);
}