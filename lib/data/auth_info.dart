class AuthInfo {
  final String accessToken;

  AuthInfo(this.accessToken);

  AuthInfo.fromJson(dynamic json) : accessToken = json['access'];
}
