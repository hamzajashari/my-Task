import 'package:flutter/material.dart';
import 'package:myTask/Shared%20Data/colors.dart';
import 'package:myTask/Shared%20Data/styles.dart';

class editTask extends StatefulWidget {
  const editTask({Key? key}) : super(key: key);

  @override
  State<editTask> createState() => _editTaskState();
}

class _editTaskState extends State<editTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('Update Task', style: appBarStyle),
    toolbarHeight: 40,
    backgroundColor: primaryColor,
    elevation: 0.0,
    automaticallyImplyLeading: false,
    flexibleSpace: Container(),
    centerTitle: true,
    ),
    body: Container(

      )
    );
  }
}
