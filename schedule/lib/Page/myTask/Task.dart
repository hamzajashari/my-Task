import 'package:bottomnavbar/Shared%20Data/buttons.dart';
import 'package:bottomnavbar/Shared%20Data/colors.dart';
import 'package:bottomnavbar/Shared%20Data/styles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Firebase.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  List dataList = [];
  DateTime? _dateTime;
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
      body: FutureBuilder (
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => modalCreate(context),
        tooltip: 'Add new task',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget buildItems(dataList) => ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: dataList.length,
      itemBuilder: (BuildContext context, int index) {
        return new GestureDetector(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
              leading: Icon(Icons.task),
              title: Text(dataList[index]["name"] ?? "Name not found",
                style: TaskNameText,),
            ),
          ),
        ),
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
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }
            );
          },

        );
      }

      );

  modalCreate(BuildContext context) {
    var form = GlobalKey<FormState>();
    var name = TextEditingController();
    var description = TextEditingController();
    var date = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Create new task'),
          content: Form(
            key: form,
            child: Container(
              height: MediaQuery.of(context).size.height /3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Name'),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Ex.: Party, Gym',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    controller: name,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'All fields are required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  Text('Description'),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: '(Optional)',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    controller: description,
                  ),
                  Text('Date'),
                TextField(
                  controller: date, //editing controller of this TextField
                  decoration: InputDecoration(
                      icon: Icon(Icons.calendar_today), //icon of text field
                      labelText: "Enter Date" //label text of field
                  ),
                  readOnly: true,  //set it true, so that user will not able to edit text
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context, initialDate: DateTime.now(),
                        firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2101)
                    );

                    if(pickedDate != null ){
                      print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                      print(formattedDate); //formatted date output using intl package =>  2021-03-16
                      //you can implement different kind of Date Format here according to your requirement

                      setState(() {
                        date.text = formattedDate; //set output date to TextField value.
                      });
                    }else{
                      print("Date is not selected");
                    }
                  },
                )
                ],
              ),
            ),
          ),
          actions: <Widget>[
            myTaskOutlineBtn('Cancel', () {
              Navigator.of(context).pop();
            }),
            myTaskFlatBtn('Create', () async {
              if (form.currentState!.validate()) {
                await FirebaseFirestore.instance.collection('task').add({
                  'name': name.text,
                  'description': description.text,
                  'date' : date.text,
                  'created_date': Timestamp.now(),
                });
                Navigator.of(context).pop();
              }
              buildItems(dataList);
            }
            ),
          ],
        );
      },
    );
  }
}