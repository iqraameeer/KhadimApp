class SigninModel {
  final String? accessToken;
  final int? expiresIn;
  final String? tokenType;

  SigninModel({
    this.accessToken,
    this.expiresIn,
    this.tokenType,
  });

  factory SigninModel.fromJson(Map<String, dynamic> json) {
    return SigninModel(
      accessToken: json['access_token'] as String?,
      expiresIn: json['expires_in'] as int?,
      tokenType: json['token_type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'access_token': accessToken,
      'expires_in': expiresIn,
      'token_type': tokenType,
    };
  }

  bool get isAuthenticated => accessToken != null && accessToken!.isNotEmpty;
}