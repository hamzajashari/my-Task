import'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:myTask/Auth/HomePage.dart';
import 'package:myTask/Shared%20Data/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:image_picker/image_picker.dart';

import '../../Shared Data/styles.dart';
import 'Projects.dart';

const String _Github = 'https://github.com/hamzajashari';
const String _Facebook = 'https://facebook.com/hamzajashari10';
const String _In = 'https://www.linkedin.com/in/hamzajashari';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;


  _signOut() async {
    await _firebaseAuth.signOut();
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("user");
  }

  File? _selectedFile;
  final double coverHeight = 280;
  final profileHeight = 144;

  get top => coverHeight - profileHeight / 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile',style: appBarStyle),
        toolbarHeight: 40,
        backgroundColor: primaryColor,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        flexibleSpace: Container(),
        centerTitle: true,
        actions: [
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
        ],
      ),
      body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Colors.white12,Colors.white10]),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              BuildTop(),
              BuildContent(),
            ],
          )
      ),
    );
  }

  Stack BuildTop() {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        CoverImage(),
        Positioned(
          top: top,
          child: ProfileImage(),
        )
      ],
    );
  }
  Widget CoverImage() =>
      Container(
        color: Colors.grey,
        child: Image.network(
          'https://res.cloudinary.com/practicaldev/image/fetch/s--ZmPcIbAW--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://dzone.com/storage/temp/12334613-971.jpg'
          ,
          width: double.infinity,
          height: coverHeight,
          fit: BoxFit.cover,
        ),
      );

  Widget ProfileImage() => Stack(
    clipBehavior: Clip.none,
    alignment: Alignment.center,
    children: [
          CircleAvatar(
             radius: profileHeight / 2,
             backgroundColor: Colors.grey.shade800,
             backgroundImage: NetworkImage('https://static-cdn.jtvnw.net/jtv_user_pictures/programming-profile_image-82029196c527ed90-300x300.png'),
    ),
      Positioned(
        height: 35,
        width: 35,
        top: 110,
        left: 110,
        child: FloatingActionButton(
          heroTag: "Add Profile",
          onPressed: () {
            print("Add new Profile Picture //TODO");
          },
          backgroundColor: Colors.blueAccent,
          child: const Icon(Icons.add),
        ),
      )
    ],
  );

  Widget BuildContent() =>
      Column(
        children: <Widget> [
          const SizedBox(
            height: 28,
          ),
          Padding(
            padding: EdgeInsets.only(top: 65),
            child: Text('Hamza Jashari',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700)),
          ),
          Text('Flutter Developer', style: TextStyle(fontFamily: 'RobotoMono')),
          Social(),
          ProjectAndFollowers(),
          const SizedBox(
            height: 30,
          ),
          Repo(),
        ],
      );

  Widget Social() =>
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () => setState(() {
                _launchInBrowser(_Facebook);
              }),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.network(
                  'https://image.similarpng.com/very-thumbnail/2021/01/Facebook-icon-design-on-transparent-background-PNG.png',
                  width: 40, height: 40,),
              ),
            ),
            InkWell(
              onTap: () => setState(() {
                _launchInBrowser(_Github);
              }),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/Octicons-mark-github.svg/2048px-Octicons-mark-github.svg.png',
                  width: 40, height: 40,),
              ),

            ),
            InkWell(
              onTap: () => setState(() {
                _launchInBrowser(_In);
              }),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.network(
                  'https://cdn.icon-icons.com/icons2/2428/PNG/512/linkedin_black_logo_icon_147114.png',
                  width: 40, height: 40,),
              ),
            )
          ],
        ),
      );

  Widget ProjectAndFollowers() =>
      Card(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Column(
                  children: const [
                    Text("Project",
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 22.0,
                          fontWeight: FontWeight.w600
                      ),),
                    SizedBox(
                      height: 7,
                    ),
                    Text("15",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22.0,
                          fontWeight: FontWeight.w300
                      ),)
                  ],
                ),
              ),
              Expanded(
                child:
                Column(
                  children: const [
                    Text("Followers",
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 22.0,
                          fontWeight: FontWeight.w600
                      ),),
                    SizedBox(
                      height: 7,
                    ),
                    Text("2000",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22.0,
                          fontWeight: FontWeight.w300
                      ),)
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  Widget Repo() =>
      GestureDetector(
        onTap: (){
          showModalBottomSheet(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)),
              ),
              context: context,
              builder: (context){
                return  PrintProjects();
              }
          );
        },
        child: Material(
          elevation: 7.0,
          borderRadius: BorderRadius.all(const Radius.circular(10.0)),
          child: InkWell(
            child: Ink(
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [Colors.purpleAccent, Colors.deepPurpleAccent]),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              height: 48,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  SizedBox(width: 48),
                  Expanded(
                    child: Center(
                      child: Text(
                        "View Projects",
                      style: TextStyle(fontSize: 30,fontWeight: FontWeight.w300,color: Colors.white),),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 40.0,
                      child: Icon(
                        Icons.send,
                        color: Colors.white,
                        size: 23.0,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),

        ),
      );
  Future<void> _launchInBrowser(String url) async {
    if (!await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    )) {
      throw 'Could not launch $url';
    }
  }

  Future getImage(ImageSource source) async {
    try {
      final image = await ImagePicker.pickImage(source: source);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        _selectedFile = imageTemporary;
      });
    }
    on PlatformException catch(e){
      print('Failed to pick image: $e');
    }
  }

}