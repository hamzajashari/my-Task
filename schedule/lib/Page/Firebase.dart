import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Database {
  List taskList = [];
  FirebaseFirestore? firestore;
  initiliase() {
    firestore = FirebaseFirestore.instance;
  }
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
  Future<List> read() async {
    QuerySnapshot querySnapshot;
    List docs = [];
    try {
      querySnapshot =
      (await firestore?.collection('countries').orderBy('timestamp').get())!;
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          Map a = {"id": doc.id, "name": doc['name'], "code": doc["code"]};
          docs.add(a);
        }
        return docs;
      }
    } catch (e) {
      print(e);
    }
    return docs;
  }

  Future<void> create(String name, String description,String date) async {
    try {
      await firestore?.collection("task").add({
        'name': name,
        'description': description,
        'date': date,
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> delete(String id) async {
    try {
      await firestore?.collection("task").doc(id).delete();
    } catch (e) {
      print(e);
    }
  }


  Future<void> update(String id, String name, String code) async {
    try {
      await firestore
          ?.collection("countries")
          .doc(id)
          .update({'name': name, 'code': code});
    } catch (e) {
      print(e);
    }
  }
}