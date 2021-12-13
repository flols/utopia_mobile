import 'package:flutter/material.dart';
//import 'package:utopia_mobile/shared/widgets/palette.dart';

const textInputDecoration = InputDecoration(
  fillColor: iconcolor,
  filled: true,
  contentPadding: EdgeInsets.all(12.0),

  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color:Colors.blueGrey, width:1.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color:primaryColor, width:1.0),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(color:Colors.red, width:1.0),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: BorderSide(color:Colors.red, width:1.0),
  ),
);

//inspiration couleur "https://github.com/abuanwar072/Flutter-Responsive-Admin-Panel-or-Dashboard"

const primaryColor = Color(0xFF2697FF);
const secondaryColor = Color(0xFF2A2D3E);
const bgColor = Color(0xFF212332);
const textcolor = Color(0xFFFFFFFF);
const iconcolor = Color(0xFF606060);

const defaultPadding = 16.0;