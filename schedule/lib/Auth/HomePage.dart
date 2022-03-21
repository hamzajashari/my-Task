import 'package:bottomnavbar/Shared%20Data/buttons.dart';
import 'package:bottomnavbar/Shared%20Data/colors.dart';
import 'package:bottomnavbar/Shared%20Data/styles.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'SignUpPage.dart';
import 'SignInPage.dart';

class HomePage extends StatefulWidget {

  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/mytask1.png', width: 190, height: 190),
          Container(
            child: Text('Welcome!', style: logoStyle),
          ),
          Container(
            width: 200,
            margin: EdgeInsets.only(bottom: 0),
            child: myTaskFlatBtn('Sign In', (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => SignInPage()),);
            }),
          ),
          Container(
            width: 200,
            padding: EdgeInsets.all(0),
            child: myTaskOutlineBtn('Sign Up', (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()),);
              // Navigator.of(context).pushReplacementNamed('/signup');
             }),
          ),
          Container(
            margin: EdgeInsets.only(top: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: <Widget>[
                Text('Langauage:', style: TextStyle(color: darkText)),
                Container(
                  margin: EdgeInsets.only(left: 6),
                  child: Text('English ›', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500)),
                )
              ],
            ),
          )
        ],
      )),
      backgroundColor: bgColor,
    );
  }
}
