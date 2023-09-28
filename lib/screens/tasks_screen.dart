import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_to_do_app/providers/provider.dart';
import 'package:flutter_to_do_app/screens/deleted_task_screen.dart';
import 'package:flutter_to_do_app/widgets/build_task_widget.dart';

class TaskScreen extends ConsumerWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var tags = ref.watch(tagsProvider);

    return DefaultTabController(
      length: tags.length + 3,
      child: Scaffold(
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
          bottom: TabBar(isScrollable: true, tabs: [
            const Tab(text: "All"),
            const Tab(text: "Completed"),
            const Tab(text: "Incompleted"),
            ...tags.map((e) => Tab(text: e.name)).toList()
          ]),
        ),
        body: TabBarView(children: [
          const BuildTask(filter: 'all'),
          const BuildTask(filter: 'completed'),
          const BuildTask(filter: 'incompleted'),
          ...tags.map((e) => BuildTask(filter: e.name)).toList()
        ]),
      ),
    );
  }
}
