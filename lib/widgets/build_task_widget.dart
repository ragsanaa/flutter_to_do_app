import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_to_do_app/models/task.dart';
import 'package:flutter_to_do_app/providers/provider.dart';

class BuildTask extends ConsumerWidget {
  final String filter;
  const BuildTask({
    super.key,
    this.filter = 'all',
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Task> tasks = [];

    switch (filter) {
      case 'all':
        tasks = ref.watch(taskProvider);
      case 'completed':
        tasks = ref
            .watch(taskProvider)
            .where((element) => element.isCompleted)
            .toList();
      case 'incompleted':
        tasks = ref
            .watch(taskProvider)
            .where((element) => !element.isCompleted)
            .toList();
      default:
        tasks = ref
            .watch(taskProvider)
            .where((element) => element.category
                .where((element) => element.name == filter)
                .isNotEmpty)
            .toList();
    }

    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        var task = tasks[index];
        return Dismissible(
          key: Key(task.title),
          onDismissed: (direction) {
            ref.read(taskProvider.notifier).removeTask(task);
            ref.read(deletedTaskProvider.notifier).addDeletedTask(task);
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Task deleted and moved to deleted tasks!'),
                duration: Duration(seconds: 1)));
          },
          background: Container(
            color: Colors.red,
            child: const Icon(Icons.delete, color: Colors.white),
          ),
          child: ListTile(
            enabled: !task.isCompleted,
            title: Text(
              task.title,
              style: TextStyle(
                  decoration: task.isCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none),
            ),
            subtitle: Text(task.description),
            trailing: Checkbox(
              value: task.isCompleted,
              onChanged: (value) {
                ref.read(taskProvider.notifier).updateTask(task);
              },
            ),
          ),
        );
      },
    );
  }
}
