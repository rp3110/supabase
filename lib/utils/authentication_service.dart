import 'package:flutter/foundation.dart';
import 'package:supabase/supabase.dart';
import 'package:supabase_auth/utils/supabase_credential.dart';
import 'package:url_launcher/url_launcher.dart';

import 'app_routes.dart';
import 'navigator_key.dart';

class AuthenticationService {
  ///this function performs signup.
  Future signup({
    required String email,
    required String password,
  }) async {
    GotrueSessionResponse response = await SupabaseCredentials
        .supabaseCredential.auth
        .signUp(email, password);
    if (response.error == null) {
      String? signUpEmail = response.data!.user!.email;
      if (kDebugMode) {
        print('Login Successful: $signUpEmail ');
      }
      NavigatorKey.navigatorKey.currentState!
          .popAndPushNamed(AppRoutes.homeScreen, arguments: 0);
    } else {
      if (kDebugMode) {
        print('signup failed: ${response.error!.message}');
      }
    }
  }

  ///this function performs login.

  Future login({
    required String email,
    required String password,
  }) async {
    GotrueSessionResponse response =
        await SupabaseCredentials.supabaseCredential.auth.signIn(
            email: email,
            password: password,
            options: AuthOptions(redirectTo: SupabaseCredentials.apiURL));
    if (response.error == null) {
      String? signUpEmail = response.data!.user!.email;
      if (kDebugMode) {
        print('Login Successful: $signUpEmail ');
      }
      NavigatorKey.navigatorKey.currentState!
          .popAndPushNamed(AppRoutes.homeScreen, arguments: 0);
    } else {
      if (kDebugMode) {
        print('Login failed: ${response.error!.message}');
      }
    }
  }

  /// Used to send the otp
  Future sendOtp({
    required String phone,
  }) async {
    try {
      GotrueSessionResponse response =
          await SupabaseCredentials.supabaseCredential.auth.signIn(
              phone: phone,
              options: AuthOptions(redirectTo: SupabaseCredentials.apiURL));
      if (response.error == null) {
        if (kDebugMode) {
          print(response.data);
        }
      } else {
        if (kDebugMode) {
          print('Login failed3: ${response.error!.message}');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  /// A function that is used to verify the otp sent by twilio.
  Future verifyOtp({
    required String phone,
    required String token,
  }) async {
    try {
      GotrueSessionResponse response = await SupabaseCredentials
          .supabaseCredential.auth
          .verifyOTP(phone, token);
      if (response.error == null) {
        if (kDebugMode) {
          print(response.data);
        }
        NavigatorKey.navigatorKey.currentState!
            .popAndPushNamed(AppRoutes.homeScreen, arguments: 0);
      } else {
        if (kDebugMode) {
          print('Login failed3: ${response.error!.message}');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  /// A function that is used to login to github.
  Future githubLogin() async {
    try {
      GotrueSessionResponse response = await SupabaseCredentials
          .supabaseCredential.auth
          .signIn(provider: Provider.github);
      if (response.error == null) {
        String? urlLogin = response.url!;
        launchUrl(Uri.parse(urlLogin), mode: LaunchMode.externalApplication);
      } else {
        if (kDebugMode) {
          print('Login failed3:------------- ${response.error!.message}');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("e-------------------${e.toString()}");
      }
    }
  }

  /// A function that is used to login to facebook.
  Future facebookLogin() async {
    try {
      GotrueSessionResponse response = await SupabaseCredentials
          .supabaseCredential.auth
          .signIn(provider: Provider.facebook);
      if (response.error == null) {
        if (kDebugMode) {
          print("response---------------${response.url}");
        }
        String? urlLogin = response.url!;
        launchUrl(Uri.parse(urlLogin), mode: LaunchMode.externalApplication);
      } else {
        if (kDebugMode) {
          print('Login failed3: ${response.error!.message}');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('fbError---------${e.toString()}');
      }
    }
  }
}
