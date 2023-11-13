import 'package:crickon/Task/Controller/TaskController.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskWithGetX extends StatefulWidget {
  const TaskWithGetX({super.key});

  @override
  State<TaskWithGetX> createState() => _TaskWithGetXState();
}

class _TaskWithGetXState extends State<TaskWithGetX> {
  @override
  void initState() {
    Get.put<TaskController>(TaskController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Fetched Users'),
        ),
        body: GetX(
            init: TaskController.instance,
            builder: (taskController) {
              final list = taskController.list;

              if (list!.isEmpty) {
                return const Center(
                  child: Text('No Data Found'),
                );
              }

              return ListView.separated(
                  itemBuilder: (context, index) {
                    final user = list[index];

                    return ListTile(
                      title: Wrap(
                        children: [
                          Text(user.userId.toString()),
                          Text(user.title.toString()),
                        ],
                      ),
                      subtitle: Text(user.body.toString()),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemCount: list.length);
            }),
      );
}
