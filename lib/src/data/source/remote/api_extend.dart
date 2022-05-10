class ApiConfig {
  static const apiBaseUrl = "https://newsapi.org/v2";
  static const apiKey = "2a731ce5d9874d41a282962bc4bbb915";
}

class SpecialCode {
  static const int noSupportMethod = 1;
  static const int noNetwork = 2;
  static const int unauthorized = 401;

  // add more, ex: token fail, ...
}

enum ApiMethod { get, post, put, delete }

enum ApiBodyType { form, json, formUrlencoded }

class ApiData {
  final String path;
  final ApiMethod method;
  final Map<String, dynamic>? queryParams;
  final Map<String, String>? headers;
  final dynamic params;
  final ApiBodyType? bodyType;

  ApiData({
    required this.method,
    this.path = "",
    this.queryParams = const {},
    this.headers = const {},
    this.params = const {},
    this.bodyType = ApiBodyType.json,
  });
}
