import 'package:flutter/material.dart';
import 'package:utopia_mobile/models/user.dart';
import 'package:provider/provider.dart';
import 'package:utopia_mobile/shared/widgets/services/authentication.dart';

class UtopiaHomePage extends StatefulWidget {
  const UtopiaHomePage({Key? key}) : super(key: key);

  @override
  _UtopiaHomePageState createState() => _UtopiaHomePageState();
}

class _UtopiaHomePageState extends State<UtopiaHomePage> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<AppUser?>.value(
      value: Authentication().user,
      initialData: null,
      child: MaterialApp(),
    );
  }
}
