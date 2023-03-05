import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_auth/utils/app_providers.dart';
import 'package:supabase_auth/utils/route_generator.dart';

import 'utils/navigator_key.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  /// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: AppProvider.providers, child: const Lava());
  }
}

class Lava extends StatelessWidget {
  const Lava({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: RouteGenerator.generateRoute,
      navigatorKey: NavigatorKey.navigatorKey,
    );
  }
}
