import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:supabase_auth/utils/auth_notification_provider.dart';
import 'package:supabase_auth/utils/database_notifier.dart';

class AppProvider {
  ///List of providers
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (_) => AuthenticationNotifier()),
    ChangeNotifierProvider(create: (_) => DatabaseNotifier()),
  ];
}
