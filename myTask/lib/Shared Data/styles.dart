import 'package:flutter/material.dart';
import './colors.dart';

/////////////////////////////////
///   TEXT STYLES
////////////////////////////////

const logoStyle = TextStyle(
    fontFamily: 'Pacifico',
    fontSize: 20,
    color: Colors.black54,
    letterSpacing: 2);

const appBarStyle = TextStyle(
    fontFamily: 'Pacifico',
    fontSize: 20,
    color: Colors.white,
    letterSpacing: 2);

const logoWhiteStyle = TextStyle(
    fontFamily: 'Pacifico',
    fontSize: 21,
    letterSpacing: 2,
    color: Colors.white);
const daysStyle = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 30,
    letterSpacing: 2,
    color: primaryColor);
const whiteText = TextStyle(color: Colors.white, fontFamily: 'Poppins');
const disabledText = TextStyle(color: Colors.grey, fontFamily: 'Poppins');
const contrastText = TextStyle(color: primaryColor, fontFamily: 'Poppins');
const contrastTextBold = TextStyle(
    color: primaryColor, fontFamily: 'Poppins', fontWeight: FontWeight.w600);

const h3 = TextStyle(
    color: Colors.black,
    fontSize: 24,
    fontWeight: FontWeight.w800,
    fontFamily: 'Poppins');

const h4 = TextStyle(
    color: Colors.black,
    fontSize: 18,
    fontWeight: FontWeight.w700,
    fontFamily: 'Poppins');
    
const h5 = TextStyle(
    color: Colors.black,
    fontSize: 18,
    fontWeight: FontWeight.w500,
    fontFamily: 'Poppins');

    const h6 = TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontFamily: 'Poppins');


const priceText = TextStyle(
    color: Colors.black,
    fontSize: 19,
    fontWeight: FontWeight.w800,
    fontFamily: 'Poppins');

const TaskNameText = TextStyle(
    color: primaryColor,
    fontSize: 17,
    fontWeight: FontWeight.w600,
    fontFamily: 'Poppins');

const TaskDescriptionText = TextStyle(
    color: Colors.black26,
    fontSize: 13,
    fontWeight: FontWeight.w300,
    fontFamily: 'Poppins');

const TaskDateText = TextStyle(
    color: Colors.black12,
    fontSize: 11,
    fontWeight: FontWeight.w500,
    fontFamily: 'Poppins');

const tabLinkStyle =
    TextStyle(fontWeight: FontWeight.w500);

const taglineText = TextStyle(color: Colors.grey, fontFamily: 'Poppins');
const categoryText = TextStyle(
    color: Color(0xff444444),
    fontWeight: FontWeight.w700,
    fontFamily: 'Poppins');

const inputFieldTextStyle =
    TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w500);

const inputFieldHintTextStyle =
    TextStyle(fontFamily: 'Poppins', color: Color(0xff444444));

const inputFieldPasswordTextStyle = TextStyle(
    fontFamily: 'Poppins', fontWeight: FontWeight.w500, letterSpacing: 3);

const inputFieldHintPaswordTextStyle = TextStyle(
    fontFamily: 'Poppins', color: Color(0xff444444), letterSpacing: 2);

///////////////////////////////////
/// BOX DECORATION STYLES
//////////////////////////////////

const authPlateDecoration = BoxDecoration(
    color: white,
    boxShadow: [
      BoxShadow(
          color: Color.fromRGBO(0, 0, 0, .1),
          blurRadius: 10,
          spreadRadius: 5,
          offset: Offset(0, 1))
    ],
    borderRadius: BorderRadiusDirectional.only(
        bottomEnd: Radius.circular(20), bottomStart: Radius.circular(20)));

/////////////////////////////////////
/// INPUT FIELD DECORATION STYLES
////////////////////////////////////

const inputFieldFocusedBorderStyle = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(6)),
    borderSide: BorderSide(
      color: primaryColor,
    ));

const inputFieldDefaultBorderStyle = OutlineInputBorder(
    gapPadding: 0, borderRadius: BorderRadius.all(Radius.circular(6)));
