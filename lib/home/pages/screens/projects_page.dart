import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:utopia_mobile/shared/widgets/constants.dart';
//import 'package:utopia_mobile/shared/widgets/projectsPage/ProjectsList.dart';
//import 'package:utopia_mobile/shared/widgets/projectsPage/highTitle.dart';
//import 'package:utopia_mobile/shared/widgets/projectsPage/lowTitle.dart';
//import 'package:utopia_mobile/shared/widgets/projectsPage/moderateTitle.dart';
import 'package:utopia_mobile/widgets/constants.dart';
import 'package:utopia_mobile/widgets/projectsPage/ProjectsList.dart';
import 'package:utopia_mobile/widgets/projectsPage/highTitle.dart';
import 'package:utopia_mobile/widgets/projectsPage/lowTitle.dart';
import 'package:utopia_mobile/widgets/projectsPage/moderateTitle.dart';



class ProjectsPage extends StatefulWidget {
  ProjectsPage({Key? key}) : super(key: key);

  @override
  _ProjectsPageState createState() =>  _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Projects'),
        backgroundColor: secondaryColor,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            color: textcolor,
            onPressed: () async{
              await _auth.signOut();
            },
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            color: textcolor,
            onPressed: (){},
          ),
        ],
      ),
      backgroundColor: Color(0xF5F6FA),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.only(top: 10.0)),
            highTitle(),
            ProjectsListMain('Ai Marketing','www.aimarketing.com', '50% / Mensuel'),
            moderateTitle(),
            ProjectsListMain('Robot Gold','www.autotrade.com', '10% / Mensuel'),
            ProjectsListMain('Robot Forex','www.samtradefx.com', '13% / Mensuel'),
            lowTitle(),
            ProjectsListMain('Robot Crypto','www.kryll.com', '25% / Mensuel'),

          ],
        ),
      ),

    );
  }
}
