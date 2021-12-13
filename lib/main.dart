import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:utopia_mobile/home/splashscreen_wrapper.dart';
import 'package:utopia_mobile/shared/widgets/constants.dart';
import 'package:utopia_mobile/shared/widgets/services/authentication.dart';
import 'home/home_page.dart';
import 'home/login_page.dart';
import 'home/my_home_page.dart';
import 'home/my_phone_authentication_page.dart';
import 'package:firebase_core/firebase_core.dart';

import 'models/user.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<AppUser?>.value(
      value: Authentication().user,
      initialData: null,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: bgColor,
          textTheme: GoogleFonts.poppinsTextTheme(Theme
              .of(context)
              .textTheme)
              .apply(bodyColor: Colors.white),
          canvasColor: secondaryColor,
        ),
        home: SplashScreenWrapper(),
        //home: HomePage(),
        //home: LoginPage(),
      ),
    );
  }
}
