import 'package:flutter/material.dart';
import 'package:flutter_final_course_task/module/api.dart';
import 'package:flutter_final_course_task/module/json.dart';
import 'package:http/http.dart' as http;

class TaskList extends StatelessWidget {
  const TaskList({
    Key? key,
    required this.id,
  }) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Task>>(
      future: fetchTasks(http.Client(), id),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(
                'An error has occurred! ${snapshot.error}'),
          );
        } else if (snapshot.hasData) {
          var _taskData = snapshot.data!;
          return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: _taskData.length,
              itemBuilder: (context, index) {
                return ListTile(
                  trailing: Checkbox(
                      value: _taskData[index].completed,
                      onChanged: null),
                  title: Text(_taskData[index].title),
                );
              });
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
