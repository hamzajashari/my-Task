
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myTask/Screens/navbarscreen.dart';
import 'package:myTask/Shared%20Data/colors.dart';
import 'package:myTask/Shared%20Data/inputFields.dart';
import 'package:myTask/Shared%20Data/styles.dart';
import 'package:page_transition/page_transition.dart';
import 'SignInPage.dart';


class SignUpPage extends StatefulWidget {

  SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _auth = FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fullnameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        title: Text('Sign Up',
            style: TextStyle(
                color: Colors.grey, fontFamily: 'Poppins', fontSize: 15)),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.rightToLeft, child: SignInPage()));

            },
            child: Text('Sign In', style: contrastText),
          )
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Container(
        padding: EdgeInsets.only(left: 18, right: 18),
        child: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Welcome to myTask!', style: h3),
                Text('Let\'s get started', style: taglineText),
                myTaskEmailInput('Email Address',emailController),
                myTaskTextInput('Full Name',fullnameController),
                myTaskPasswordInput('Password',passwordController)
              ],
            ),
            Positioned(
              bottom: 15,
              right: -15,
              child: FlatButton(
                onPressed: () async {
                    try{
                      await _auth.createUserWithEmailAndPassword(
                          email: emailController.text, password: passwordController.text);
                      await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (contex) => navbarscreen(),
                          ));
                    } catch (e){
                      showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                          title:
                          Text(' Ops! Registration Failed'),
                      content: Text('${e}')));
                    }

                },
                color: primaryColor,
                padding: EdgeInsets.all(13),
               shape: CircleBorder(),
                child: Icon(Icons.arrow_forward, color: white),
              ),
            ),

          ],
        ),
        height: 360,

        width: double.infinity,
        decoration: authPlateDecoration,
      ),
        ],
      )
    );
  }
}
