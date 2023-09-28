import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_to_do_app/models/tag.dart';
import 'package:flutter_to_do_app/models/task.dart';
import 'package:flutter_to_do_app/providers/provider.dart';

class AddTaskWidget extends ConsumerWidget {
  AddTaskWidget({super.key});
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var tags = ref.watch(tagsProvider);

    List<Tag> selectedTags = [];
    return AlertDialog(
      title: const Text('Add New Task'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(
                label: Text('Title'), border: OutlineInputBorder()),
          ),
          TextField(
            controller: descriptionController,
            decoration: const InputDecoration(
                label: Text('Description'), border: OutlineInputBorder()),
          ),
          const Text('Tags'),
          Wrap(
            children: tags
                .map((e) => ChoiceChip(
                      label: Text(e.name),
                      labelStyle: const TextStyle(color: Colors.white),
                      labelPadding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 2),
                      backgroundColor: e.color.withOpacity(0.7),
                      selected: e.isSelected,
                      selectedColor: e.color,
                      onSelected: (value) {
                        ref.read(tagsProvider.notifier).toggleTagSelection(e);
                        if (value) {
                          selectedTags.add(e);
                        } else {
                          selectedTags.remove(e);
                        }
                      },
                    ))
                .toList(),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            ref.read(taskProvider.notifier).addTask(Task(
                title: titleController.text,
                description: descriptionController.text,
                category: selectedTags));
            ref.read(tagsProvider.notifier).resetTags();
            Navigator.of(context).pop();
          },
          child: const Text('Add'),
        ),
      ],
    );
  }
}
