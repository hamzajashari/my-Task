<img src="https://i.ibb.co/GR7S1jc/firebaseflutter.png" style="zoom: 15%;" />

Mobile application using Flutter framework for all CRUD operations is used Firebase database.



## Home Page 

<img src="https://i.ibb.co/Dwgp3PB/Screenshot-1648837165.png" alt="Home Page" style="zoom: 25%;" />

Во овој Home widget има вкупно две копче, сите се поставени внатре во посебен Container со точно 200 должина, при клик на копче постоји функција кај што редиректира во содветен widget.

```dart
Container(
  width: 200,
  child: myTaskFlatBtn('Sign In', (){
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignInPage()),);
  }),
),
Container(
  width: 200,
  child: myTaskOutlineBtn('Sign Up', (){
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()),);
   }),
```

| <img src="https://i.ibb.co/WByk8T0/Screenshot-1648837168.png" alt="Sign In" style="zoom: 25%;" /> | <img src="https://i.ibb.co/gZYpStj/Screenshot-1648837170.png" alt="Sign Up" style="zoom: 25%;" /> |
| :----------------------------------------------------------: | :----------------------------------------------------------: |

```dart
final _auth = FirebaseAuth.instance; 
```

За да може корисникот да го користи апликацијата мора треба да има свој профил, во зависно од тоа дали има профил постојат два начини на логирање Sign In и Sign Up. 

Исто така копчето за да се потврди и да се продожи со користење на апликацијата, има проверки дали успешно се напишани информациите. Дали тој корисник е добро автентициран и при секоја грешка има pop-up порака.

```dart
showDialog( 
      context: context,
      builder: (ctx) => AlertDialog(
          title:
          Text(' Ops! Login Failed'),
          content: Text('${e}')));
}
```

Доколку корисникот е добро автентициран се логира во апликацијата.

```dart
try{
  await _auth.signInWithEmailAndPassword(
      email: emailController.text, password: passwordController.text);
  Navigator.of(context).push(
      MaterialPageRoute(
        builder: (contex) => navbarscreen(),
      ));
} 
```

## Task 

<img src="https://i.ibb.co/Qffb5B5/Screenshot-1648837096.png" alt="Task" style="zoom: 25%;" />

Секој таск е инстанца од класата Task по доле може да ги гледате сите атрибути:

```dart
class Task {
  String _id;
  String _name;
  String _description;
  String _date;
  Task(this._id, this._name, this._description, this._date);
}
```

За да може да се листира секој таск, се користи листа од таскови и секој таск има свој идентификувач. Подоле се покажува како е повикан функцијата ***getData()*** од класата кај се дефинирани сите CRUD операции.  

```dart
FutureBuilder (
  future: Firebase().getData(),
  builder: (context, snapshot) {
    if (snapshot.hasError) {
      return const Text(
        "Something went wrong",
      );
    }
    if (snapshot.connectionState == ConnectionState.done) {
      data = snapshot.data as List<Task>;
      return buildItems(data);
    }
    return const Center(child: CircularProgressIndicator());
  },
),
```

## Create Task

<img src="https://i.ibb.co/cN3nJtr/Screenshot-1648837153.png" style="zoom: 25%;" />

Кога се креира нов таск прво сите полиња се задожителни потоа при плик на копчето **Create** се креира нов и се печати во листата на таскови. Со помош на фунцијата **create()** и праќање на потребните атрибути за нов таск тој се креира.

*Како тоа копче функционира е прикажен подоле.*

```dart
myTaskFlatBtn('Create', () async {
  if (form.currentState!.validate()) {
    Firebase().create(name.text, description.text,date.text);
    Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.bottomToTop,
        child: navbarscreen(),
      ),
    );
  }
}
```



## Update Task

<img src="https://i.ibb.co/YcVH5Gt/Screenshot-1648837160.png" style="zoom: 25%;" />

За да може еден таск да се update-ира треба да го имаме неговиот id, тоа го направиме при селекција на таскот и кликање на копчето update, после тоа се повика функција getTaskById(task.id) и доколку све успешно е најдено таскот се враќа во овој widget. За секој поле е поставено како labelText претходната состојба на тој таск. Корисникот има можност сите полиња да ги промени и да кликне **Update**. Ова копче функционира вака: 

```dart
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
```

 На почеток се креира нова инстанца на моделот и се инициализират сите променети атрибути, потоа се вика функцијата за update.

## Delete Task

Се користи **Dismissible** кој ни помага при **direction: DismissDirection.endToStart** *(drag од крај до почеток)*  да се избрише таскот, за да се избрише и во база кодот изгледа вака:

```dart
onDismissed: (_) {
  setState(() {
    Firebase().delete(dataList.elementAt(index).id);
    dataList.removeAt(index);
  });
},
```

## Google Map

<img src="https://i.ibb.co/8Xq832Z/Screenshot-1648837137.png" alt="Google Map" style="zoom: 25%;" />

Со помош на дополнителни библиотеки за Maps и API key од Google овој widget е во можност да се користи, како функција за LongPress можеме да додаваме Origin и Destination, oткако се креира маркерот за дестинација треба да се прикажи нај кратката патека меѓу тие две маркери *(во моментов не функционир но кодот е напишан)*

```dart
GoogleMap(
  myLocationButtonEnabled: false,
  zoomControlsEnabled: false,
  initialCameraPosition: _initialCameraPosition,
  onMapCreated: (controller) => _googleMapController = controller,
  markers: {
    if (_origin != null) _origin!,
    if (_destination != null) _destination!,
  },
  polylines: {
    if (_info != null)
      Polyline(
        polylineId: const PolylineId('overview_polyline'),
        color: Colors.red,
        width: 5,
        points: _info!.polylinePoints
            .map((e) => LatLng(e.latitude, e.longitude))
            .toList(),
      ),
  },
  onLongPress: _addMarker,
),
```





## Camera 

<img src="https://i.ibb.co/V2DQDDk/Screenshot-1648837140.png" alt="Camera Page" style="zoom: 25%;" />

Ова функција е главната за да овозможи да се прикаже сликата во екран, исто така доколку аргументот што го прима ова функција е ImageSource.camera тогаш таа слика се чува фо уредот кој што се корисити, односно во Pictures фолдерот. 

```dart
Future getImage(ImageSource source) async {
  ImagePicker.pickImage(source: source).then((File recordedImage) {
    final imageTemporary = File(recordedImage.path);
    setState(() {
      _selectedFile = imageTemporary;
      firstButtonText = 'saving in progress...';
    });

    //save if image is captured from camera
    if (source == ImageSource.camera)
      GallerySaver.saveImage(recordedImage.path);
  });
}
```

## Profile

<img src="https://i.ibb.co/vj0YTKf/Screenshot-1648837144.png" alt="Profile Page" style="zoom: 25%;" />

Чисто информативно widget нема некоја функција освен при клик не некој од копчето за социални мрежи се редиректира во содветен линк. Исто така десно горе има копче за Log Out на корисникот и тоа функционира вака:

```dart
TextButton(
  style: TextButton.styleFrom(
    primary: Colors.green,
    textStyle: const TextStyle(fontWeight: FontWeight.w600),
  ),
  onPressed: () async {
      await _signOut();
      if (_firebaseAuth.currentUser == null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      }
    },
  child: Icon(Icons.exit_to_app_rounded, color: white,),
),
```

 

За сите CRUD операци ги креирав овие функции од класата **Firebase**:

```dart
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
```



За да може да го стартувате ова апликација во терминал пишувате: `flutter run --no-sound-null-safety`
