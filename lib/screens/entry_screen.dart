import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_to_do_app/providers/provider.dart';
import 'package:flutter_to_do_app/screens/home_screen.dart';
import 'package:flutter_to_do_app/screens/tasks_screen.dart';
import 'package:flutter_to_do_app/widgets/add_task_widget.dart';

class EntryScreen extends ConsumerWidget {
  EntryScreen({super.key});

  final screenList = [
    const HomeScreen(),
    AddTaskWidget(),
    const TaskScreen(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var currentScreenIndex = ref.watch(currentScreenProvider);
    return Scaffold(
      body: screenList[currentScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "Add Task",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "Tasks",
          ),
        ],
        currentIndex: currentScreenIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          if (value == 1) {
            showDialog(
                context: context,
                builder: (context) {
                  return AddTaskWidget();
                });
          } else {
            ref.read(currentScreenProvider.notifier).update((state) => value);
          }
        },
      ),
    );
  }
}
