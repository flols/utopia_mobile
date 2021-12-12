import 'package:flutter/material.dart';

class bottomBorderWidget extends StatelessWidget {
  const bottomBorderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25, top: 0, right: 25, bottom: 0),
      decoration: BoxDecoration(
        border: Border (
          bottom: BorderSide(width: 1.5, color: Colors.black),
        ),
      ),
    );
  }
}
