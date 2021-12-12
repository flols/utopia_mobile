import 'package:flutter/material.dart';
import 'package:utopia_mobile/shared/widgets/constants.dart';

class RoadmapPage extends StatefulWidget {
  const RoadmapPage({Key? key}) : super(key: key);

  @override
  _RoadmapPageState createState() => _RoadmapPageState();
}

class _RoadmapPageState extends State<RoadmapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RoadMap'),
        backgroundColor: secondaryColor,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            color: textcolor,
            onPressed: (){},
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            color: textcolor,
            onPressed: (){},
          ),
        ],
      ),
      backgroundColor: Color(0xF5F6FA),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
          ],
        ),
      ),

    );
  }
}
