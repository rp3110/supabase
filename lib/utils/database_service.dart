import 'package:flutter/cupertino.dart';
import 'package:supabase/supabase.dart';
import 'package:supabase_auth/utils/supabase_credential.dart';

class DatabaseService {
  /// It adds a new to-do to the database.
  ///
  /// Args:
  ///   title (String): The title of the to-do item.
  ///   description (String): The description of the to-do item.
  Future addToDo({required String title, required String description}) async {
    PostgrestResponse response = await SupabaseCredentials.supabaseCredential
        .from('todo')
        .insert({'title': title, 'description': description}).execute();
    if (response.data != null) {
      var data = response;
      return data;
    } else {
      debugPrint(response.status.toString());
    }
  }

  /// It fetches the to-do list from the database.
  Future fetchToDo() async {
    var response = await SupabaseCredentials.supabaseCredential
        .from('todo')
        .select()
        .execute();
    var data = response.data;
    return data;
  }
}
