import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:myTask/Screens/navbarscreen.dart';
import 'package:myTask/Shared%20Data/colors.dart';
import 'package:myTask/Shared%20Data/styles.dart';
import '../../Model/Task.dart';
import '../../Shared Data/buttons.dart';
import '../../Shared Data/inputFields.dart';
import '../DB/Firebase.dart';
class editTask extends StatefulWidget {
  final String taskId;
  const editTask({Key? key, required this.taskId,}) : super(key: key);

  @override
  State<editTask> createState() => _editTaskState();
}

class _editTaskState extends State<editTask> {
  Task task=new Task("","","","");


  Future<void> init() async {
    task=await Firebase().getTaskById(widget.taskId);
  }
  var name = TextEditingController();
  var description = TextEditingController();
  var date = TextEditingController();

  @override
  void initState() {
    init();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
        title: const Text('Update Task', style: appBarStyle),
          leading: GestureDetector(
            child: Icon( Icons.arrow_back_ios, color: Colors.white,),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (
                    context) =>const navbarscreen()),
              );
            } ,
          ) ,
    toolbarHeight: 40,
    backgroundColor: primaryColor,
    elevation: 0.0,
    automaticallyImplyLeading: false,
    flexibleSpace: Container(),
    centerTitle: true,
    ),
    body: ListView(
      shrinkWrap: true,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 50, right: 50,top: 25),
          child: Stack(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Name',style: h6,),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0,top: 5),
                    child: myTaskEmailInput(task.name,name,),
                  ),
                  SizedBox(height: 20),
                  Text('Description',style: h6),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0,top: 5),
                    child: myTaskTextInput(task.description,description),
                  ),
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
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: myTaskFlatBtn('Update', () async {
                        task.name = name.text;
                        task.description = description.text;
                        task.date = date.text;
                        if (name.text != "" && description.text != "" && date.text != "") {
                          Firebase().update(task);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const navbarscreen()),
                          );
                        }
                      }),
                    ),
                  ),
                ],
              ),

            ],
          ),
          height: MediaQuery.of(context).size.height / 1.8,
          width: double.infinity,
          decoration: authPlateDecoration,
        ),
      ],
    )
    );
  }

}
