import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_to_do_app/providers/provider.dart';

class DeletedTaskScreen extends ConsumerWidget {
  const DeletedTaskScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var deletedTask = ref.watch(deletedTaskProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deleted Tasks'),
      ),
      body: deletedTask.isEmpty
          ? const Center(
              child: Text('No deleted tasks', style: TextStyle(fontSize: 20)),
            )
          : ListView.builder(
              itemCount: deletedTask.length,
              itemBuilder: (context, index) {
                var task = deletedTask[index];

                return ListTile(
                  title: Text(task.title),
                  subtitle: Text(task.description),
                  trailing: IconButton(
                    onPressed: () {
                      ref
                          .read(deletedTaskProvider.notifier)
                          .removeDeletedTask(task);

                      ref.read(taskProvider.notifier).addTask(task);
                      ref.read(taskProvider.notifier).updateTask(task);
                    },
                    icon: const Icon(Icons.restore),
                  ),
                );
              },
            ),
    );
  }
}
