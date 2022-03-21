class Task {
  String? name, description, date;

  Task({this.name, this.description, this.date});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'date': date
    };
  }

  Task.fromFirestore(Map<String, dynamic> firestore)
      :
        name = firestore['name'],
        description = firestore['description'],
        date = firestore['date'];

}