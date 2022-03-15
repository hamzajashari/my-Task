//
// import 'dart:collection';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class DatabaseManager {
//   final CollectionReference profileList =
//       FirebaseFirestore.instance.collection('monday');
//
//   Future<void> createUserData(
//       String name, String description,Timestamp date, String uid) async {
//     return await profileList.doc(uid)
//         .set({'name': name, 'description': description, 'date': date});
//   }
//
//   Future updateUserList(String name, String description, Timestamp date, String uid) async {
//     return await profileList.doc(uid).update({
//       'name': name, 'description': description, 'date': date
//     });
//   }
//
//   Future getUsersList() async {
//     List itemsList = [];
//
//     try {
//       await profileList.get().then((querySnapshot) {
//         querySnapshot.docs.forEach((element) {
//           itemsList.add(element.data);
//         });
//       });
//       print(itemsList);
//       return itemsList;
//     } catch (e) {
//       print(e.toString());
//       return null;
//     }
//   }
//     Future _getEventsFromFirestore() async {
//     CollectionReference ref = FirebaseFirestore.instance.collection('monday');
//     QuerySnapshot eventsQuery = await ref
//         .where("time", isGreaterThan: new DateTime.now().millisecondsSinceEpoch)
//         .where("food", isEqualTo: true)
//         .get();
//
//     HashMap<String, AustinFeedsMeEvent> eventsHashMap = new HashMap<String, AustinFeedsMeEvent>();
//
//     eventsQuery.docs.forEach((document) {
//       eventsHashMap.putIfAbsent(document['id'], () => new AustinFeedsMeEvent(
//           name: document['name'],
//           time: document['time'],
//           description: document['description'],
//           url: document['event_url'],
//           photoUrl: _getEventPhotoUrl(document['group']),
//           latLng: _getLatLng(document)));
//     });
//
//     return eventsHashMap.values.toList();
//   }
// }