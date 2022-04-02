
import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  String _id;
  String _name;
  String _description;
  String _date;
  Task(this._id, this._name, this._description, this._date);

  String get id => _id;

  set id(String value) {
    _id = value;
  }

  Map<String,dynamic> toMap(){
    return {
      'id' : _id,
      'name' : _name,
      'description' : _description,
      'date' : _date,
    };
  }

  Task.fromFirestore(DocumentSnapshot document)
      : _id = document.id,
        _name = document.get('name'),
        _description = document.get('description'),
        _date = document.get('date');

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get date => _date;

  set date(String value) {
    _date = value;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }
}





