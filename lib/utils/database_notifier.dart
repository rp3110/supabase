import 'package:flutter/foundation.dart';
import 'package:supabase_auth/utils/database_service.dart';

import '../module/models/database_model.dart';

class DatabaseNotifier extends ChangeNotifier {
  final DatabaseService _databaseService = DatabaseService();

  ///add the data to db
  Future addToDo({required String title, required String description}) async {
    await _databaseService.addToDo(title: title, description: description);
  }
  ///fetch the data from db
  Future<List<Todo>> fetchToDo() async {
    List data = await _databaseService.fetchToDo();
    return data.map((e) => Todo.fromJson(e)).toList();
  }
}
