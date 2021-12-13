import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:utopia_mobile/shared/widgets/constants.dart';
import 'package:utopia_mobile/shared/widgets/settingPage/bottomBorderWidget.dart';
import 'package:utopia_mobile/shared/widgets/settingPage/settingsListWidget.dart';
import 'package:utopia_mobile/shared/widgets/settingPage/verifiedWidget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
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
            verifiedWidget(),
            bottomBorderWidget(),
            settingsListWidget('assets/images/IconLogo/taskcenter.png', 'Task Center', 'assets/images/IconLogo/rightarrow.png'),
            settingsListWidget('assets/images/IconLogo/id.png', 'My Referral ID', 'assets/images/IconLogo/rightarrow.png'),
            settingsListWidget('assets/images/IconLogo/gift.png', 'My Gifts', 'assets/images/IconLogo/rightarrow.png'),
            settingsListWidget('assets/images/IconLogo/notification.png', 'Notifications', 'assets/images/IconLogo/rightarrow.png'),
            settingsListWidget('assets/images/IconLogo/security.png', 'Security', 'assets/images/IconLogo/rightarrow.png'),
            settingsListWidget('assets/images/IconLogo/settings.png', 'Settings', 'assets/images/IconLogo/rightarrow.png'),
            settingsListWidget('assets/images/IconLogo/help.png', 'Help & Support', 'assets/images/IconLogo/rightarrow.png'),
            settingsListWidget('assets/images/IconLogo/share.png', 'Share The App', 'assets/images/IconLogo/rightarrow.png'),
            settingsListWidget('assets/images/IconLogo/pin.png', 'Change PIN Code', 'assets/images/IconLogo/rightarrow.png'),
            settingsListWidget('assets/images/IconLogo/blocked.png', 'Block Card', 'assets/images/IconLogo/rightarrow.png'),
            settingsListWidget('assets/images/IconLogo/download.png', 'Download Statement', 'assets/images/IconLogo/rightarrow.png'),
          ],
        ),
      ),

    );
  }
}
