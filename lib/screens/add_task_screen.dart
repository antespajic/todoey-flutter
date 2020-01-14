import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task.dart';
import 'package:todoey_flutter/models/task_list.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final controller = TextEditingController();

  addTask(String text) {
    Provider.of<TaskList>(context, listen: false).add(Task(name: text));
    controller.clear();
    Navigator.pop(context);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF757575),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontWeight: FontWeight.w500,
                fontSize: 30,
              ),
            ),
            TextField(
              controller: controller,
              autofocus: true,
              onSubmitted: (value) => addTask(value),
            ),
            SizedBox(
              height: 12,
            ),
            FlatButton(
              color: Colors.lightBlueAccent,
              textColor: Colors.white,
              child: Text('Add task'),
              onPressed: () => addTask(controller.text),
            )
          ],
        ),
      ),
    );
  }
}
