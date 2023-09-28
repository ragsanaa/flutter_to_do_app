import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_to_do_app/models/task.dart';

class DeletedTaskNotifier extends StateNotifier<List<Task>> {
  DeletedTaskNotifier() : super([]);

  void addDeletedTask(Task task) {
    state = [...state, task];
  }

  void removeDeletedTask(Task task) {
    state = state.where((element) => element != task).toList();
  }
}
