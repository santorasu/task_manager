import 'package:flutter/material.dart';
import 'package:task_management/data/models/task_status_count_list_model.dart';
import 'package:task_management/data/models/task_status_count_model.dart';
import 'package:task_management/data/service/network_client.dart';
import 'package:task_management/ui/screens/add_new_task_screen.dart';
import 'package:task_management/ui/widgets/snack_bar_message.dart';

import '../../data/utils/urls.dart';
import '../widgets/summary_card.dart';
import '../widgets/task_card.dart';

class NewTasksScreen extends StatefulWidget {
  const NewTasksScreen({super.key});

  @override
  State<NewTasksScreen> createState() => _NewTasksScreenState();
}

class _NewTasksScreenState extends State<NewTasksScreen> {
  bool _getStatusCountInProgress = false;
  List<TaskStatusCountModel> _taskStatusCountList = [];

  @override
  void initState() {
    super.initState();
    _getAllTaskStatusCount();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildSummarySection(),
            ListView.separated(
              itemCount: 6,
              primary: false,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return const TaskCard(taskStatus: TaskStatus.sNew);
              },
              separatorBuilder: (context, index) => const SizedBox(height: 8),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onTabAddNew,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _onTabAddNew() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddNewTaskScreen()),
    );
  }

  Widget _buildSummarySection() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 100,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _taskStatusCountList.length,
          itemBuilder: (context, index) {
            return SummaryCard(
              title: _taskStatusCountList[index].status,
              count: _taskStatusCountList[index].count,
            );
          },
        ),
      ),
      // child: Row(
      //   children: [
      //     SummaryCard(title: 'New', count: 12),
      //     SummaryCard(title: 'Progress', count: 23),
      //     SummaryCard(title: 'Completed', count: 15),
      //     SummaryCard(title: 'Cancelled', count: 25),
      //   ],
      // ),
    );
  }

  Future<void> _getAllTaskStatusCount() async {
    _getStatusCountInProgress = true;
    setState(() {});
    final NetworkResponse response = await NetworkClient.getRequest(
      url: Urls.taskStatusCountUrl,
    );

    if (response.isSuccess) {
      TaskStatusCountListModel taskStatusCountListModel =
          TaskStatusCountListModel.fromJson(response.data ?? {});
      _taskStatusCountList = taskStatusCountListModel.statusCountList;
    } else {
      showSnackBarMessage(context, response.errorMessage, true);
    }
    _getStatusCountInProgress = false;
    setState(() {});
  }
}
