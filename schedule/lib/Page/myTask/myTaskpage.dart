import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myTask/Shared%20Data/colors.dart';
import '../../Shared Data/buttons.dart';
import '../../Shared Data/styles.dart';
import '../Firebase.dart';
class Task1Page extends StatefulWidget {
  const Task1Page({Key? key}) : super(key: key);

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<Task1Page> {
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
          future: Database().getData(),
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
                  return Container(
                    height: 500,
                    child: Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading: Icon(Icons.task),
                            title: Text(dataList[index]["name"] ?? "Name not found",
                              style: TaskNameText,),

                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0,top: 20.0),
                                child: Text(dataList[index]["description"] ?? "Description not found",
                                  style: TaskDescriptionText,),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(top: 30.0,bottom: 25.0),
                                child: Text(dataList[index]["date"] ?? "Date not found",
                                  style: TaskDateText,),
                              ),
                              Center(
                                child: Row(
                                  children: [
                                    myTaskFlatBtn('Update', () {

                                    }),
                                    const SizedBox(width: 8),

                                    myTaskDeleteBtn('Delete', () {
                                    }),
                                    const SizedBox(width: 8),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
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