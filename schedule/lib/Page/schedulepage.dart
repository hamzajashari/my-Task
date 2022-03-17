import 'package:bottomnavbar/Shared%20Data/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:css_colors/css_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Model/Task.dart';
import '../Shared Data/styles.dart';
import 'Firebase.dart';
import 'Profile/Projects.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  List dataList = [];
  final Stream<QuerySnapshot> task =
      FirebaseFirestore.instance.collection('task').snapshots();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Task', style: appBarStyle),
          toolbarHeight: 40,
          backgroundColor: primaryColor,
          elevation: 0.0,
          automaticallyImplyLeading: false,
          flexibleSpace: Container(),
          centerTitle: true,
        ),
        body:
            // Container(
            //   decoration: new BoxDecoration(
            //       gradient: RadialGradient(
            //     center: Alignment.bottomCenter,
            //     colors: [
            //       Colors.lightBlueAccent,
            //       Colors.blueAccent,
            //     ],
            //     focal: Alignment.bottomCenter,
            //   )),
            // ),
            // Container(
            //              height: MediaQuery.of(context).size.height,
            //              padding: const EdgeInsets.only(top: 10),
            //              child: StreamBuilder<QuerySnapshot>(
            //                stream: task,
            //                builder: (
            //                  BuildContext context,
            //                  AsyncSnapshot<QuerySnapshot> snapshot,
            //                ) {
            //                  if (snapshot.hasError) {
            //                    return Text("Something went wrong.");
            //                  }
            //                  if (snapshot.connectionState ==
            //                      ConnectionState.waiting) {
            //                    return Text("Loading");
            //                  }
            //                  final data = snapshot.requireData;
            //                  return ListView.builder(
            //                    itemCount: data.size,
            //                    itemBuilder: (context, index) {
            //                      return Padding(
            //                        padding:
            //                            const EdgeInsets.only(left: 20, bottom: 15),
            //                        child: Text('${data.docs[index]['name']} \n',
            //                            style: TaskNameText),
            //                      );
            //                    },
            //                  );
            //                },
            //              ),
            //      // decoration: BoxDecoration(
            //      //   borderRadius: BorderRadius.circular(28),
            //      //   color: Colors.white,
            //      //   boxShadow: [
            //      //     BoxShadow(
            //      //       color: Colors.grey.withOpacity(0.5),
            //      //       spreadRadius: 3,
            //      //       blurRadius: 5,
            //      //       offset: Offset(-1, 0), // changes position of shadow
            //      //     ),
            //      //   ],
            //      // ),
            //    ),
            FutureBuilder(
          future: FireStoreDataBase().getData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text(
                "Something went wrong",
              );
            }
            if (snapshot.connectionState == ConnectionState.done) {
              dataList = snapshot.data as List;
              return buildItems(dataList);
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
        floatingActionButton: new FloatingActionButton(
          elevation: 0.0,
          child: new Icon(Icons.add),
          backgroundColor: primaryColor,
          onPressed: () {
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)),
                  ),
                  context: context,
                  builder: (context){
                    return  PrintProjects();
                  }
              );
          },
        ));
  }

  Widget buildItems(dataList) => ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: dataList.length,
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          onTap: (){
            showModalBottomSheet(
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)),
            ),
            context: context,
            builder: (context){
            return  PrintProjects();
            }
            );
          },
          leading: CircleAvatar(
            radius: 15,
            backgroundColor: highlightColor,
          ),
          title: Text(
            dataList[index]["name"] ?? "Name not found",
            style: TaskNameText,
          ),
        );
      });
}
