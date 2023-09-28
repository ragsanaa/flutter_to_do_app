import 'package:flutter/material.dart';
import 'package:flutter_to_do_app/screens/deleted_task_screen.dart';
import 'package:flutter_to_do_app/widgets/build_task_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Tasks'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const DeletedTaskScreen();
              }));
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: BuildTask(filter: 'incompleted'),
    );
  }
}
