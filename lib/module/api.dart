import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_final_course_task/module/json.dart';
import 'package:http/http.dart' as http;

Future<List<User>> fetchUsers(http.Client client) async {
  final response = await client.get(
    Uri.parse('https://jsonplaceholder.typicode.com/users'),
  );
  // Use the compute function to run parseUsers in a separate isolate.
  return compute(parseUsers, response.body);
}

List<User> parseUsers(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<User>((json) => User.fromJson(json)).toList();
}

Future<List<Task>> fetchTasks(http.Client client, int userId) async {
  final response = await client.get(
    Uri.parse('https://jsonplaceholder.typicode.com/todos?userId=$userId'),
  );
  // Use the compute function to run parseUsers in a separate isolate.
  return compute(parseTasks, response.body);
}

List<Task> parseTasks(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Task>((json) => Task.fromJson(json)).toList();
}
