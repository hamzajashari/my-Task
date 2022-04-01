import 'package:flutter/material.dart';
import './colors.dart';

FlatButton myTaskFlatBtn(String text, onPressed) {
  return FlatButton(
    onPressed: onPressed,
    child: Text(text),
    textColor: white,
    color: primaryColor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
  );
}
FlatButton updateBtn(onPressed) {
  return FlatButton(
    onPressed: onPressed,
    child: Icon(Icons.update,color: primaryColor,),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
  );
}


OutlineButton myTaskOutlineBtn(String text, onPressed) {
  return OutlineButton(
    onPressed: onPressed,
    child: Text(text),
    textColor: primaryColor,
    highlightedBorderColor: highlightColor,
    borderSide: BorderSide(color: primaryColor),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
  );
}
FlatButton myTaskDeleteBtn(String text, onPressed) {
  return FlatButton(
    onPressed: onPressed,
    child: Text(text),
    textColor: Colors.white,
    color: Colors.redAccent,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
  );
}