// inspiration tutoriel "https://www.youtube.com/watch?v=KQKiZx5N_J0&feature=youtu.be&ab_channel=DavidSilvera"
import 'package:flutter/material.dart';
import 'package:utopia_mobile/widgets/constants.dart';
import 'package:utopia_mobile/widgets/loading.dart';
import 'package:utopia_mobile/widgets/services/authentication.dart';
//import 'package:utopia_mobile/shared/widgets/constants.dart';
//import 'package:utopia_mobile/shared/widgets/loading.dart';
//import 'package:utopia_mobile/shared/widgets/palette.dart';
//import 'package:utopia_mobile/shared/widgets/services/authentication.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final Authentication _auth = Authentication();
  final _formkey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool showSignIn = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void toggleView() {
    setState(() {
      _formkey.currentState?.reset();
      error = '';
      emailController.text = '';
      passwordController.text = '';
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: bgColor,
            appBar: AppBar(
              backgroundColor: secondaryColor,
              elevation: 0.0,
              title:
                  Text(showSignIn ? 'Connectez-vous' : 'Enregistrez-vous',
                  style: TextStyle(
                    color: primaryColor,
                  ),),
              actions: <Widget>[
                TextButton.icon(
                  icon: Icon(
                    Icons.person,
                    color: primaryColor,
                  ),
                  label: Text(showSignIn ? "Enregistrement" : 'Connexion',
                      style: TextStyle(color: primaryColor)),
                  onPressed: () => toggleView(),
                ),
              ],
            ),
            body: Container(
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailController,
                      decoration:
                          textInputDecoration.copyWith(hintText: "Email"),
                      validator: (value) =>
                          value!.isEmpty ? "Entrer un email" : null,
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      controller: passwordController,
                      decoration:
                          textInputDecoration.copyWith(hintText: "Mot de passe"),
                      obscureText: true,
                      validator: (value) => value != null && value.length < 6
                          ? "Entrer un mot de passe avec plus de 6 lettres"
                          : null,
                    ),
                    SizedBox(height: 10.0),
                    ElevatedButton(
                      child: Text(
                        showSignIn ? "Connexion" : "Enregistrement",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        if (_formkey.currentState?.validate() == true) {
                          setState(() => loading = true);
                          var password = passwordController.value.text;
                          var email = emailController.value.text;

                          dynamic result = showSignIn
                              ? await _auth.signInWithEmailAndPassword(email, password)
                              : await _auth.registerWithEmailAndPassword(email, password);
                          if (result == null) {
                            setState(() {
                              loading = false;
                              error = 'Merci de rentrer une adresse valide!';
                            });
                          }
                        }
                      },
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      error,
                      style: TextStyle(color: Colors.red, fontSize: 15.0),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
