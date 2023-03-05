import 'package:supabase/supabase.dart';

class SupabaseCredentials {
  /// This is the URL of your Supabase project.
  static const String apiURL = "https://afqpmgxehkxjgehaloya.supabase.co";

  /// The API key that is generated when you create a new project in Supabase.
  static const String apiKey =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFmcXBtZ3hlaGt4amdlaGFsb3lhIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NjU1Nzg0OTYsImV4cCI6MTk4MTE1NDQ5Nn0.df5MbOzjT4eKIZ7OfiEQ16059OIOvVN_sOu3uDZbrWM";

  /// Creating a new instance of the SupabaseClient class.
  static SupabaseClient supabaseCredential = SupabaseClient(apiURL, apiKey);
}
