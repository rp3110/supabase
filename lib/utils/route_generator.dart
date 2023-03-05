import 'package:flutter/material.dart';
import 'package:supabase_auth/module/ui/home/home_page.dart';
import 'package:supabase_auth/utils/app_routes.dart';

import '../module/auth/login_page/login_scereen.dart';
import '../module/auth/phone_login/phone_login.dart';
import '../module/auth/signup/signup_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.loginScreen:
        return MaterialPageRoute(
            builder: (_) => const ScreenLogin(),
            settings: const RouteSettings(name: AppRoutes.loginScreen));
      case AppRoutes.signupScreen:
        return MaterialPageRoute(
            builder: (_) => const ScreenSignup(),
            settings: const RouteSettings(name: AppRoutes.signupScreen));
      case AppRoutes.homeScreen:
        return MaterialPageRoute(
            builder: (_) => const ScreenHome(),
            settings: const RouteSettings(name: AppRoutes.homeScreen));
      case AppRoutes.phoneLogin:
        return MaterialPageRoute(
            builder: (_) => const PhoneLogin(),
            settings: const RouteSettings(name: AppRoutes.phoneLogin));
      default:
        return MaterialPageRoute(
            builder: (_) => const ScreenSignup(),
            settings: const RouteSettings(name: AppRoutes.loginScreen));
    }
  }
}
