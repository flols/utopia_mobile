import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utopia_mobile/home/utopia_home_page.dart';
import 'package:utopia_mobile/models/user.dart';
import 'home_page.dart';
import 'login_page.dart';
import 'my_phone_authentication_page.dart';

class SplashScreenWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser?>(context);
    if (user == null) {
      return LoginPage();
    } else {
      //return MyPhoneAuthenticationPage();
      return HomePage();
    }
  }
}