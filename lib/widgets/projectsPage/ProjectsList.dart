import 'package:flutter/material.dart';

import '../constants.dart';



class ProjectsListMain extends StatelessWidget {

  String ProjectName;
  String ProjectDesc;
  String ProjectChange;

  ProjectsListMain(ProjectName,ProjectDesc,ProjectChange):ProjectName = ProjectName, ProjectDesc = ProjectDesc, ProjectChange = ProjectChange;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, top: 0, right: 10, bottom: 10),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(10),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 20,),
                Container(
                  margin: EdgeInsets.only(left: 0, top: 5, right: 0, bottom: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(ProjectName),
                      Text(ProjectDesc,
                        style: TextStyle(color: iconcolor,
                          fontWeight: FontWeight.w300,
                          fontSize: 15,
                        ),),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 0,),


          SizedBox(width: 50,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(ProjectChange,
                style: TextStyle(color: primaryColor,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}