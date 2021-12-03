import 'package:flutter/material.dart';

class HourWidget extends StatelessWidget {

  Color? boxColor;
  String hour;

  HourWidget({
    Key? key,
    this.boxColor,
    required this.hour
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: 50.0,
      decoration: BoxDecoration(
          color: boxColor ?? Colors.black12,
          borderRadius: BorderRadius.circular(10.0)
      ),
      child: Center(child:
      Text(hour,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
        ),
      )
      ),
    );
  }
}
