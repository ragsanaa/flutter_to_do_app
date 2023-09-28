import 'package:flutter/material.dart';

class Tag {
  final String name;
  final Color color;
  bool isSelected;

  Tag({
    required this.name,
    this.color = Colors.blue,
    this.isSelected = false,
  });

  Tag copyWith({
    String? name,
    Color? color,
    bool? isSelected,
  }) {
    return Tag(
      name: name ?? this.name,
      color: color ?? this.color,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
