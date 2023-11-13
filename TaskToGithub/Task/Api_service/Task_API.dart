import 'dart:convert';

import 'package:crickon/Task/Models/TaskUserModel.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class TaskAPI {
  static const userEndPointUrl = 'https://jsonplaceholder.typicode.com/posts';

  static Future<List<TaskUserModel>> fetchData() async {
    final response = await http.get(Uri.parse(userEndPointUrl));

    if (response.statusCode == 200) {
      // Successful response
      final List<dynamic> jsonDataList = json.decode(response.body);
      final List<TaskUserModel> userList =
          jsonDataList.map((json) => TaskUserModel.fromJson(json)).toList();
      return userList;
    } else {
      // Handle errors
      throw Exception(
          'Failed to load data. Status code: ${response.statusCode}');
    }
  }
}
