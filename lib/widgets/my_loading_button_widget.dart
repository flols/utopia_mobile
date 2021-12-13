import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:utopia_mobile/widgets/palette.dart';
//import 'package:utopia_mobile/shared/widgets/palette.dart';

class MyLoadingButtonWidget extends StatefulWidget {
  Color? color;
  String? text;
  final GestureTapCallback press;
  final RoundedLoadingButtonController btnController;

  MyLoadingButtonWidget(
      {Key? key,
      required this.press,
      required this.btnController,
      this.text,
      this.color})
      : super(key: key);

  @override
  _MyLoadingButtonWidgetState createState() => _MyLoadingButtonWidgetState();
}

class _MyLoadingButtonWidgetState extends State<MyLoadingButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return RoundedLoadingButton(
      child: Text(
        widget.text ?? "Submit",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
        ),
      ),
      color: widget.color ?? Palette.appMainColor,
      controller: widget.btnController,
      onPressed: widget.press,
    );
  }
}
