import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_list.dart';

import 'task_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskList>(
      builder: (context, taskList, _) => ListView.builder(
        itemBuilder: (context, index) => TaskTile(
          onDismiss: (direction) => taskList.remove(index),
          onChanged: (state) => taskList.toggle(index),
          task: taskList[index],
        ),
        itemCount: taskList.length,
      ),
    );
  }
}
