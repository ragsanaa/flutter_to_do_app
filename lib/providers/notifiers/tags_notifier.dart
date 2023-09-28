import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_to_do_app/models/tag.dart';

class TagsNotifier extends StateNotifier<List<Tag>> {
  TagsNotifier()
      : super([
          Tag(name: 'Work', color: Colors.red),
          Tag(name: 'Home', color: Colors.purple),
          Tag(name: 'Personal', color: Colors.blue),
        ]);

  void addTag(Tag tag) {
    state = [...state, tag];
  }

  void removeTag(Tag tag) {
    state = state.where((element) => element != tag).toList();
  }

  void toggleTagSelection(Tag tag) {
    state = [
      for (var item in state)
        if (item == tag) item.copyWith(isSelected: !item.isSelected) else item
    ];
  }

  void resetTags() {
    state = [for (var item in state) item.copyWith(isSelected: false)];
  }
}
