import 'package:get/get.dart';

class Task {
  Task(String title, {bool done = false})
      : title = RxString(title),
        done = RxBool(done);

  final RxString title;
  RxBool done;
  // Convert a Task to a Map
  Map<String, dynamic> toJson() => {
    'title': title,
    'done': done,
  };

  // Convert a Map to a Task
  factory Task.fromJson(Map<String, dynamic> json) => Task(
    json['title'],
    done: json['done'],
  );
}