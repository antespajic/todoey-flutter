import 'package:flutter/foundation.dart';
import 'package:todoey_flutter/models/task.dart';

class TaskList with ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy bread'),
  ];

  int get length => _tasks.length;

  add(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  toggle(int index) {
    _tasks[index].toggleDone();
    notifyListeners();
  }

  remove(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }

  Task operator [](int index) => _tasks[index];
}
