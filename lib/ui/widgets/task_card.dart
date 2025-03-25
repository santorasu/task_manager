import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Title will be here",style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),),
            Text("Description will be here"),
            Text("Date: 2023-01-01"),
            Row(
              children: [
                Chip(
                  label: Text("New", style: TextStyle(color: Colors.white)),
                  padding: EdgeInsets.symmetric(horizontal: 8,),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  backgroundColor: Colors.blue,
                  side: BorderSide.none,
                ),
                const Spacer(),
                IconButton(onPressed: (){}, icon: const Icon(Icons.delete)),
                IconButton(onPressed: (){}, icon: const Icon(Icons.edit)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}