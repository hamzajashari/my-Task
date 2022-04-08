import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:myTask/Model/Task.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Firebase {

  String _user="";
  String get user => _user;

  set user(String value) {
    _user = value;
  }

  Firebase(){
  }
  List<Task> taskList = [];

  Future getData() async {
    final prefs = await SharedPreferences.getInstance();
      QuerySnapshot _collectionRef = await FirebaseFirestore.instance.collection("task").where('createdBy',isEqualTo: prefs.getString("user").toString()).get();
    try {
        for (var result in _collectionRef.docs) {
          taskList.add(new Task(result.id,result.get('name'),result.get('description'),result.get('date')));
        }
      return taskList;
    } catch (e) {
      debugPrint("Error - $e");
      return null;
    }
  }


  void create(String name,String description,String date,String createdBy) async {
    try {
      await FirebaseFirestore.instance.collection("task").add({
        'name': name,
        'description': description,
        'date' : date,
        'created_date': Timestamp.now(),
        'createdBy': createdBy,
      });
    } catch (e) {
      print(e);
    }
  }
  void update(Task task) async {
    try {
      FirebaseFirestore.instance.collection("task").doc(task.id).update({
        'name': task.name,
        'description': task.description,
        'date' : task.date,
        'created_date': Timestamp.now(),
      });
    } catch (e) {
      print(e);
    }
  }
  void delete(String id) async {
    try {
      FirebaseFirestore.instance.collection("task").doc(id).delete();
    } catch (e) {
      print(e);
    }
  }


  Future<Task> getTaskById(String taskId) async {
    Task task= new Task("","","","");
    var docSnapshot =await FirebaseFirestore.instance.collection("task").doc(taskId).get();
    if (docSnapshot.exists) {
      task=new Task(taskId,docSnapshot.get('name'),docSnapshot.get("description"),docSnapshot.get("date"));
      // Call setState if needed.
    }
    return task;
  }
}
