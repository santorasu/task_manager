import 'package:flutter/material.dart';
import 'package:task_management/ui/screens/add_new_task_screen.dart';

import '../widgets/summary_card.dart';
import '../widgets/task_card.dart';

class NewTasksScreen extends StatefulWidget {
  const NewTasksScreen({super.key});

  @override
  State<NewTasksScreen> createState() => _NewTasksScreenState();
}

class _NewTasksScreenState extends State<NewTasksScreen> {
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
                return const TaskCard(taskStatus: TaskStatus.sNew,);
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

  void _onTabAddNew(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => AddNewTaskScreen()));
  }

  Widget _buildSummarySection() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            SummaryCard(title: 'New', count: 12),
            SummaryCard(title: 'Progress', count: 23),
            SummaryCard(title: 'Completed', count: 15),
            SummaryCard(title: 'Cancelled', count: 25),
          ],
        ),
      ),
    );
  }
}
