import 'package:flutter/material.dart';
import 'package:myTask/Model/Task.dart';
import 'package:myTask/Shared%20Data/buttons.dart';
import 'package:myTask/Shared%20Data/colors.dart';
import 'package:myTask/Shared%20Data/styles.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:date_time_picker/date_time_picker.dart';
import '../../Screens/navbarscreen.dart';
import '../DB/Firebase.dart';
import 'Edit-Task.dart';

class TaskPage extends StatefulWidget {

  const TaskPage({Key? key}) : super(key: key);

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  List<Task> data = [];
  String user="";

  String datePicker ="";
  @override
  void initState() {
    super.initState();
    getUser();
  }
  Future<void> getUser() async {
   final prefs = await SharedPreferences.getInstance();
    Firebase().user=prefs.getString("user").toString();
    user=prefs.getString("user".toString())!;
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
        future: Firebase().getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text(
              "Something went wrong",
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            data = snapshot.data as List<Task>;
            return buildItems(data);
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'Task Add',
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
          return Dismissible(
          key: UniqueKey(),
          direction: DismissDirection.endToStart,
          background: Container(
          alignment: AlignmentDirectional.centerEnd,
          color: Colors.red,
          child: Padding(
          padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
          child: Icon(Icons.delete,
          color: Colors.black,),
          ),
          ),
          onDismissed: (_) {
            setState(() {
              Firebase().delete(dataList.elementAt(index).id);
              dataList.removeAt(index);
            });
          },
          child: GestureDetector(
            child: Card(
                child: ListTile(
                  leading: Icon(Icons.task,color: primaryColor,),
                  title: Text(dataList.elementAt(index).name ?? "Name not found",
                    style: TaskNameText,),
                    trailing: Wrap(
                    spacing: 12,
                    children: <Widget>[
                      Text(dataList.elementAt(index).date ?? "Date not found",
                        style: TaskDateText,),
                    ],
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
                      height: MediaQuery.of(context).size.height/2,
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              leading: Icon(Icons.task,color: primaryColor,),
                              title: Text(dataList.elementAt(index).name ?? "Name not found",
                                style: TaskNameText,),
                              trailing: Wrap(
                                spacing: 12,
                                children: <Widget>[
                                    updateBtn(() {
                                      String taskId= dataList.elementAt(index).id;
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (
                                            context) => editTask(taskId: taskId)),
                                      );
                                    },
                                    ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 50.0,left: 30,right: 30,top: 20),
                              child: Center(
                                child: Column(
                                  children: <Widget>[
                                    SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Text(dataList.elementAt(index).description ?? "Description not found",
                                        style: TaskDescriptionText,),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(dataList.elementAt(index).date ?? "Date not found",
                                    style: TaskDateText,),
                            ),

                          ],
                        ),
                      ),
                    );
                  }
              );
            },
          ),
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
              height: MediaQuery.of(context).size.height / 2.8,
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
                  // Text('Date'),
                  // TextField(
                  //   controller: date, //editing controller of this TextField
                  //   decoration: InputDecoration(
                  //       icon: Icon(Icons.calendar_today), //icon of text field
                  //       labelText: "Enter Date" //label text of field
                  //   ),
                  //   readOnly: true,  //set it true, so that user will not able to edit text
                  //   onTap: () async {
                  //     DateTime? pickedDate = await showDatePicker(
                  //         context: context, initialDate: DateTime.now(),
                  //         firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                  //         lastDate: DateTime(2101)
                  //     );
                  //
                  //     if(pickedDate != null ){
                  //       print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                  //       String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                  //       print(formattedDate); //formatted date output using intl package =>  2021-03-16
                  //       //you can implement different kind of Date Format here according to your requirement
                  //
                  //       setState(() {
                  //         date.text = formattedDate; //set output date to TextField value.
                  //       });
                  //     }else{
                  //       print("Date is not selected");
                  //     }
                  //   },
                  // ),
                DateTimePicker(
                type: DateTimePickerType.dateTimeSeparate,
                dateMask: 'd MMM, yyyy',
                controller: date,
               // initialValue: DateTime.now().toString(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
                icon: Icon(Icons.event),
                dateLabelText: 'Date',
                timeLabelText: "Hour",
                  onSaved: (val) => setState(() => date.text = val ?? ""),
              ),
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
                print(date.text);
                Firebase().create(name.text, description.text,date.text,user);
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.bottomToTop,
                    child: navbarscreen(),
                  ),
                );
              }
            }
            ),
          ],
        );
      },
    );
  }


}