import 'package:flutter/material.dart';
import 'package:supabase_auth/utils/authentication_service.dart';

class AuthenticationNotifier extends ChangeNotifier {
  final AuthenticationService _authenticationService = AuthenticationService();

  ///this function is used to login with email and password
  Future login({
    required String email,
    required String password,
  }) async {
    try {
      _authenticationService.login(email: email, password: password);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  ///this function is used to sign-up with email and password
  Future signup({
    required String email,
    required String password,
  }) async {
    try {
      _authenticationService.signup(email: email, password: password);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  ///this function calls _authenticationService.sendOtp to send otp
  Future sendOtp({
    required String phone,
  }) async {
    try {
      _authenticationService.sendOtp(phone: phone);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  ///this function calls _authenticationService.verifyOtp to verify otp
  Future verifyOtp({
    required String phone,
    required String token,
  }) async {
    try {
      _authenticationService.verifyOtp(phone: phone, token: token);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  ///this function calls _authenticationService.githubLogin to perform github login
  Future githubLogin() async {
    try {
      _authenticationService.githubLogin();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  ///this function calls _authenticationService.facebookLogin to perform facebookLogin
  Future facebookLogin() async {
    try {
      _authenticationService.facebookLogin();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
