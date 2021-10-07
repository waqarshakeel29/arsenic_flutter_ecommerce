import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:equatable/equatable.dart';

import 'app_user.dart';

class AuthResponse extends Equatable {
  final AppUser appUser;
  final String accessToken;
  final String? refreshToken;
  final DateTime tokenExpiry;
  const AuthResponse({
    required this.appUser,
    this.refreshToken,
    required this.tokenExpiry,
    required this.accessToken,
  });
  @override
  List<Object?> get props => [refreshToken, accessToken, tokenExpiry];

  factory AuthResponse.fromAuthApiResponse(String source) {
    final map = jsonDecode(source);
    final refreshToken = map['refresh_token'];
    final accessToken = map['access_token'];
    return AuthResponse.fromAccessAndRefreshTokens(accessToken, refreshToken);
  }

  factory AuthResponse.fromAccessAndRefreshTokens(
      String accessToken, String refreshToken) {
    Map<String, dynamic> payload = JwtDecoder.decode(accessToken);
    DateTime? expiryDate = JwtDecoder.getExpirationDate(accessToken);
    final appUser = AppUser(
      uid: payload['sub'] ?? "",
      userName: payload['nameid'],
    );

    return AuthResponse(
      refreshToken: refreshToken,
      accessToken: accessToken,
      tokenExpiry: expiryDate /*?? DateTime.now()*/,
      appUser: appUser,
    );
  }

  factory AuthResponse.fromUser(User user) {
    final appUser = AppUser(
      uid: user.uid,
      userName: user.displayName ?? "WAQAR",
    );

    return AuthResponse(
      refreshToken: user.refreshToken,
      accessToken: "",
      tokenExpiry: DateTime.now(),
      appUser: appUser,
    );
  }
}
