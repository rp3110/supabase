import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_auth/module/models/database_model.dart';
import 'package:supabase_auth/utils/database_notifier.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> with ChangeNotifier {
  /// A controller for the text field.
  final TextEditingController title = TextEditingController();

  /// A controller for the text field.
  final TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ///created notifier
    final DatabaseNotifier databaseNotifier =
        Provider.of<DatabaseNotifier>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text('todo'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              TextFormField(
                controller: title,
              ),
              TextFormField(
                controller: description,
              ),
              ElevatedButton(
                  onPressed: () async {
                    await databaseNotifier.addToDo(
                        title: title.text, description: description.text);
                    debugPrint("addToDo");
                    await databaseNotifier.fetchToDo();
                    databaseNotifier.notifyListeners();
                  },
                  child: const Text('Add')),
              SizedBox(
                height: 500,
                child: FutureBuilder(
                  future: databaseNotifier.fetchToDo(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.blue,
                        ),
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      if (snapshot.hasData) {
                        List snapshotData = snapshot.data as List;
                        return snapshotData.isNotEmpty
                            ? ListView.builder(
                                itemCount: snapshotData.length,
                                itemBuilder: (context, index) {
                                  Todo todo = snapshotData[index];
                                  return ListTile(
                                    title: Text(todo.title),
                                    subtitle: Text(todo.description),
                                  );
                                })
                            : Container();
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Colors.blue,
                          ),
                        );
                      }
                    }
                    return const Text("something went wrong");
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
