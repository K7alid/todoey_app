import 'package:flutter/material.dart';
import 'package:todoey_app/screens/tasks_screen.dart';

class TaskTitle extends StatelessWidget {
  TaskTitle({
    required this.isChecked,
    required this.taskTitle,
    required this.checkboxCallback,
    required this.longPressedCallback,
  });

  final bool isChecked;
  final String taskTitle;
  final Function checkboxCallback;
  final Function longPressedCallback;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: () {
        longPressedCallback();
      },
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: defaultColor,
        value: isChecked,
        onChanged: (value) {
          checkboxCallback(value);
        },
      ),
    );
  }
}
