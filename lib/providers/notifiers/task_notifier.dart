import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_to_do_app/models/tag.dart';
import 'package:flutter_to_do_app/models/task.dart';

class TaskNotifier extends StateNotifier<List<Task>> {
  TaskNotifier()
      : super([
          Task(
              title: 'title',
              description: 'description',
              category: [Tag(name: 'Work', color: Colors.red)]),
          Task(
              title: 'title2',
              description: 'description',
              category: [Tag(name: 'Personal', color: Colors.blue)]),
          Task(
              title: 'title3',
              description: 'description',
              category: [Tag(name: 'Work', color: Colors.red)]),
          Task(
              title: 'title4',
              description: 'description',
              category: [Tag(name: 'Work', color: Colors.red)]),
          Task(
              title: 'title5',
              description: 'description',
              category: [Tag(name: 'Home', color: Colors.purple)]),
          Task(
              title: 'title6',
              description: 'description',
              category: [Tag(name: 'Work', color: Colors.red)]),
        ]);

  void addTask(Task task) {
    state = [...state, task];
  }

  void removeTask(Task task) {
    state = state.where((element) => element != task).toList();
  }

  void updateTask(Task task) {
    state = state.map((element) {
      if (element == task) {
        return task.copyWith(isCompleted: !task.isCompleted);
      }
      return element;
    }).toList();
  }
}
