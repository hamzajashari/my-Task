import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Database {
  List taskList = [];

  final CollectionReference collectionRef =
  FirebaseFirestore.instance.collection("task");

  Future getData() async {
    try {
      await collectionRef.get().then((querySnapshot) {
        for (var result in querySnapshot.docs) {
          taskList.add(result.data());
        }
      });
      return taskList;
    } catch (e) {
      debugPrint("Error - $e");
      return null;
    }
  }
}