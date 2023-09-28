import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_to_do_app/models/tag.dart';
import 'package:flutter_to_do_app/models/task.dart';
import 'package:flutter_to_do_app/providers/notifiers/deleted_task_notifier.dart';
import 'package:flutter_to_do_app/providers/notifiers/tags_notifier.dart';
import 'package:flutter_to_do_app/providers/notifiers/task_notifier.dart';

final taskProvider = StateNotifierProvider<TaskNotifier, List<Task>>((ref) {
  return TaskNotifier();
});

final deletedTaskProvider =
    StateNotifierProvider<DeletedTaskNotifier, List<Task>>((ref) {
  return DeletedTaskNotifier();
});

final tagsProvider = StateNotifierProvider<TagsNotifier, List<Tag>>((ref) {
  return TagsNotifier();
});

final currentScreenProvider = StateProvider<int>((ref) {
  return 0;
});
