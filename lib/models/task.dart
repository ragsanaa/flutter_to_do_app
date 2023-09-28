import 'package:flutter_to_do_app/models/tag.dart';

class Task {
  final String title;
  final String description;
  final bool isCompleted;
  final List<Tag> category;

  Task({
    required this.title,
    required this.description,
    this.isCompleted = false,
    required this.category,
  });

  Task copyWith({
    String? title,
    String? description,
    bool? isCompleted,
    List<Tag>? category,
  }) {
    return Task(
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      category: category ?? this.category,
    );
  }
}
