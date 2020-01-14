import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/task.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final Function onChanged;
  final Function onDismiss;

  TaskTile({this.task, this.onChanged, this.onDismiss});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(task.name),
      onDismissed: onDismiss,
      background: Container(color: Colors.red),
      child: ListTile(
        title: Text(
          task.name,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              decoration: task.isDone
                  ? TextDecoration.lineThrough
                  : TextDecoration.none),
        ),
        trailing: Checkbox(
          value: task.isDone,
          activeColor: Colors.lightBlueAccent,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
