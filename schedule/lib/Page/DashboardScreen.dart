//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
// import '../Database/Database.dart';
//
// class DashboardScreen extends StatefulWidget {
//   @override
//   _DashboardScreenState createState() => _DashboardScreenState();
// }
//
// class _DashboardScreenState extends State<DashboardScreen> {
//
//   TextEditingController _nameController = TextEditingController();
//   TextEditingController _descriptionController = TextEditingController();
//   TextEditingController _dateController = TextEditingController();
//
//   List userProfilesList = [];
//
//   String userID = "";
//
//   @override
//   void initState() {
//     super.initState();
//     fetchDatabaseList();
//   }
//
//
//   fetchDatabaseList() async {
//     dynamic resultant = await DatabaseManager().getUsersList();
//
//     if (resultant == null) {
//       print('Unable to retrieve');
//     } else {
//       setState(() {
//         userProfilesList = resultant;
//       });
//     }
//   }
//
//   updateData(String name, String description,Timestamp date, String userID) async {
//     await DatabaseManager().updateUserList(name,description, date, userID);
//     fetchDatabaseList();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.deepPurple,
//           automaticallyImplyLeading: false,
//           actions: [
//             RaisedButton(
//               onPressed: () {
//                 openDialogueBox(context);
//               },
//               child: Icon(
//                 Icons.edit,
//                 color: Colors.white,
//               ),
//               color: Colors.deepPurple,
//             ),
//           ],
//         ),
//         body: Container(
//             child: ListView.builder(
//                 itemCount: userProfilesList.length,
//                 itemBuilder: (context, index) {
//                   return Card(
//                     child: ListTile(
//                       title: Text(userProfilesList[index]['name']),
//                       subtitle: Text(userProfilesList[index]['description']),
//                       leading: CircleAvatar(
//                         child: Image(
//                           image: AssetImage('assets/Profile_Image.png'),
//                         ),
//                       ),
//                       trailing: Text('${userProfilesList[index]['date']}'),
//                     ),
//                   );
//                 })));
//   }
//
//   openDialogueBox(BuildContext context) {
//     return showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: Text('Edit User Details'),
//             content: Container(
//               height: 150,
//               child: Column(
//                 children: [
//                   TextField(
//                     controller: _nameController,
//                     decoration: InputDecoration(hintText: 'Name'),
//                   ),
//                   TextField(
//                     controller: _descriptionController,
//                     decoration: InputDecoration(hintText: 'Description'),
//                   ),
//                   TextField(
//                     controller: _dateController,
//                     decoration: InputDecoration(hintText: 'Date'),
//                   )
//                 ],
//               ),
//             ),
//             actions: [
//               FlatButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 child: Text('Submit'),
//               ),
//               FlatButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 child: Text('Cancel'),
//               )
//             ],
//           );
//         });
//   }
//
// }