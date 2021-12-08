import 'package:flutter/material.dart';
import 'package:utopia_mobile/shared/widgets/palette.dart';

const textInputDecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  contentPadding: EdgeInsets.all(12.0),

  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color:Colors.blueGrey, width:1.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color:Palette.utopiaColor, width:1.0),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(color:Colors.red, width:1.0),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: BorderSide(color:Colors.red, width:1.0),
  ),
);