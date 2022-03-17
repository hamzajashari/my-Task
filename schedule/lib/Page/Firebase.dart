import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class FireStoreDataBase {
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

  Future<void> addTask() async {
    await printDocID();
    //creates a new doc with unique doc ID
    return collectionRef
        .add({
      'name': "TestName",
    })
        .then((value) => debugPrint("User Added"))
        .catchError((error) => debugPrint("Failed to add user: $error"));
  }

  Future<void> addField() {
    return collectionRef
        .doc('MyDoc')
    //will edit the doc if already available or will create a new doc with this given ID
        .set(
      {'role': "developer"},
      SetOptions(merge: true),
      // if set to 'false', then only these given fields will be added to that doc
    )
        .then((value) => debugPrint("User Added"))
        .catchError((error) => debugPrint("Failed to add user: $error"));
  }

  printDocID() async {
    var querySnapshots = await collectionRef.get();
    for (var snapshot in querySnapshots.docs) {
      var documentID = snapshot.id;
      debugPrint(documentID);
    }
  }
}