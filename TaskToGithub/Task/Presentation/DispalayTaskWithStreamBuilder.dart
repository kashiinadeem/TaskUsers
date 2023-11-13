import 'package:crickon/Task/Api_service/Task_API.dart';
import 'package:crickon/Task/Models/TaskUserModel.dart';
import 'package:flutter/material.dart';

class TaskWithStreamBuilder extends StatelessWidget {
  const TaskWithStreamBuilder({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Fetched Users'),
        ),
        body: StreamBuilder<List<TaskUserModel>>(
            stream: TaskAPI.fetchData().asStream(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }

              final list = snapshot.data;

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
