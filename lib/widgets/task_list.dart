import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_app/models/task_data.dart';
import 'package:todoey_app/widgets/task_title.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTitle(
              isChecked: task.isDone,
              taskTitle: task.name,
              checkboxCallback: (bool checkboxSate) {
                taskData.updateTask(task);
              },
              longPressedCallback: () {
                taskData.deleteTask(task);
              },
            );
          },
          itemCount: taskData.tasksCount,
        );
      },
    );
  }
}
