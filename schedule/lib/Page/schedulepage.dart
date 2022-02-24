import 'package:css_colors/css_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
        Container(
        decoration: new BoxDecoration(
            gradient: RadialGradient(
              center: Alignment.bottomCenter,
              colors: [
                Colors.lightBlueAccent,
                Colors.blueAccent,
              ],
              focal: Alignment.bottomCenter,
            )
        ),
      ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Center(
              child: ListView(
                physics: ClampingScrollPhysics(),
                children: <Widget>[
                  //Card Section
                  SizedBox(
                    height: 50,
                  ),

                  Container(
                      height: 450,
                      padding: const EdgeInsets.only(top: 25.0),
                      child: PageView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          Container(
                            //Monday
                            margin: EdgeInsets.only(left: 40, right: 40),
                            alignment: Alignment.center,
                            height: 1200,
                            width: 300,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Monday',
                                      style: GoogleFonts.inter(
                                          fontSize: 25, fontWeight: FontWeight.w500,color: CSSColors.black
                                      )),
                                ),

                              ],
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(28),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 5,
                                  offset:
                                  Offset(-1, 0), // changes position of shadow
                                ),
                              ],
                            ),
                          ),
                          Container(
                            //Tuesday
                            margin: EdgeInsets.only(left: 40, right: 40),
                            alignment: Alignment.center,
                            height: 450,
                            width: 300,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Tuesday',
                                      style: GoogleFonts.inter(
                                          fontSize: 25, fontWeight: FontWeight.w500,color: CSSColors.black)),
                                )
                              ],
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(28),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 5,
                                  offset:
                                  Offset(-1, 0), // changes position of shadow
                                ),
                              ],
                            ),
                          ),
                          Container(
                            //Wednesday
                            margin: EdgeInsets.only(left: 40, right: 40),
                            alignment: Alignment.center,
                            height: 450,
                            width: 300,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Wednesday',
                                      style: GoogleFonts.inter(
                                          fontSize: 25, fontWeight: FontWeight.w500,color: CSSColors.black)),
                                )
                              ],
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(28),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 5,
                                  offset:
                                  Offset(-1, 0), // changes position of shadow
                                ),
                              ],
                            ),
                          ),
                          Container(
                            //Thursday
                            margin: EdgeInsets.only(left: 40, right: 40),
                            alignment: Alignment.center,
                            height: 450,
                            width: 300,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Thursday',
                                      style: GoogleFonts.inter(
                                          fontSize: 25, fontWeight: FontWeight.w500,color: CSSColors.black)),
                                )
                              ],
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(28),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 5,
                                  offset:
                                  Offset(-1, 0), // changes position of shadow
                                ),
                              ],
                            ),
                          ),
                          Container(
                            // Friday
                            margin: EdgeInsets.only(left: 40, right: 40),
                            alignment: Alignment.center,
                            height: 450,
                            width: 300,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Friday',
                                      style: GoogleFonts.inter(
                                          fontSize: 25, fontWeight: FontWeight.w500,color: CSSColors.black)),
                                )
                              ],
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(28),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 5,
                                  offset:
                                  Offset(-1, 0), // changes position of shadow
                                ),
                              ],
                            ),
                          ),
                          Container(
                            //Saturday
                            margin: EdgeInsets.only(left: 40, right: 40),
                            alignment: Alignment.center,
                            height: 450,
                            width: 300,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Saturday',
                                      style: GoogleFonts.inter(
                                          fontSize: 25, fontWeight: FontWeight.w500,color: CSSColors.black)),
                                )
                              ],
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(28),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 5,
                                  offset:
                                  Offset(-1, 0), // changes position of shadow
                                ),
                              ],
                            ),
                          ),
                          Container(
                            //Sunday
                            margin: EdgeInsets.only(left: 40, right: 40),
                            alignment: Alignment.center,
                            height: 450,
                            width: 300,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Sunday',
                                      style: GoogleFonts.inter(
                                          fontSize: 25, fontWeight: FontWeight.w500,color: CSSColors.black)),
                                )
                              ],
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(28),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 5,
                                  offset:
                                  Offset(-1, 0), // changes position of shadow
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Color(0xff000000),
                                boxShadow: <BoxShadow>[
                                  new BoxShadow(
                                    color: Color(0x73000000),
                                    blurRadius: 5.0,
                                    spreadRadius: 1,
                                    offset: new Offset(-10.0, 0.0),
                                  ),
                                ],
                              ),
                              width: MediaQuery.of(context).size.width * 0.82,
                              height: MediaQuery.of(context).size.height * 0.25,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.82,
                                  height: MediaQuery.of(context).size.height * 0.28,
//            padding: const EdgeInsets.symmetric(horizontal: 12),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF9D276),
                                    boxShadow: <BoxShadow>[
                                      new BoxShadow(
                                        color: Color(0xff000000),
                                        blurRadius: 0.0,
                                        spreadRadius: -2,
                                        offset: new Offset(2.0, 0.0),
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(35),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
          ),
          ),
      ],
    ),
    );
  }
}
