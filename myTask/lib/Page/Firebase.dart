import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:myTask/Model/Task.dart';

class Firebase {

  Future getData() async {
    List<Task> taskList = [];
    final CollectionReference collectionRef =  FirebaseFirestore.instance.collection("task");
    try {
      await collectionRef.get().then((querySnapshot) {
        for (var result in querySnapshot.docs) {
          taskList.add(new Task(result.id,result.get('name'),result.get('description'),result.get('date')));
        }
      });
      return taskList;
    } catch (e) {
      debugPrint("Error - $e");
      return null;
    }
  }


  void create(String name,String description,String date) async {
    try {
      await FirebaseFirestore.instance.collection('task').add({
        'name': name,
        'description': description,
        'date' : date,
        'created_date': Timestamp.now(),
      });
    } catch (e) {
      print(e);
    }
  }
  void update(Task task) async {
    try {
      FirebaseFirestore.instance.collection('task').doc(task.id).update({
        'name': task.name,
        'description': task.description,
        'date' : task.date,
        'created_date': Timestamp.now(),
      });
    } catch (e) {
      print(e);
    }
  }
  void update1(String id,String name,String description,String date) async {
    try {
      FirebaseFirestore.instance.collection('task').doc(id).update({
        'name': name,
        'description': description,
        'date' : date,
        'created_date': Timestamp.now(),
      });
    } catch (e) {
      print(e);
    }
  }
  void delete(String id) async {
    try {
      FirebaseFirestore.instance.collection('task').doc(id).delete();
    } catch (e) {
      print(e);
    }
  }


  Future<Task> getTaskById(String taskId) async {
    Task task= new Task("","","","");
    var collection = FirebaseFirestore.instance.collection('task');
    var docSnapshot = await collection.doc(taskId).get();
    if (docSnapshot.exists) {
      task=new Task(taskId,docSnapshot.get('name'),docSnapshot.get("description"),docSnapshot.get("date"));
      // Call setState if needed.
    }
    return task;
  }
}