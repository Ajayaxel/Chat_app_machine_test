class AuthResponse {
  final String accessToken;
  final String tokenType;

  AuthResponse({required this.accessToken, required this.tokenType});

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    final data = json['data']['attributes']['auth_status'];
    return AuthResponse(
      accessToken: data['access_token'],
      tokenType: data['token_type'],
    );
  }
}

