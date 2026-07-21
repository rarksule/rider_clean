class AuthSession {
  final String apiKey;
  final String? refreshToken;
  final String? accessToken;

  AuthSession({
    required this.apiKey,
    this.refreshToken,
    this.accessToken,
  });
}
