import 'package:flutter/material.dart';
import 'package:utopia_mobile/shared/widgets/constants.dart';
import 'package:utopia_mobile/shared/widgets/loading.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

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
    return
      loading ?
      Loading() :
      Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          elevation: 0.0,
          title: Text(showSignIn
              ? 'Sign in to Utopia'
              : 'Register to Utopia'),
          actions: <Widget> [
            TextButton.icon(
                icon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                label: Text(showSignIn ? 'Sign In' : "Register",
                  style: TextStyle(color: Colors.white)),
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
                  decoration: textInputDecoration.copyWith(hintText: "Email"),
                  validator: (value) => value!.isEmpty ? "Enter an email" : null,
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  controller: passwordController,
                  decoration: textInputDecoration.copyWith(hintText: "Password"),
                  obscureText: true,
                  validator: (value) => value != null && value.length < 4 ? "Enter password with at least 4 characters" : null,
                ),
                SizedBox(height: 10.0),
                ElevatedButton(
                  child: Text(
                    showSignIn ? "Sign In" : "Register",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    if (_formkey.currentState?.validate() == true) {
                      setState(() => loading = true);
                      var password = passwordController.value.text;
                      var email = emailController.value.text;

                      dynamic result = null;
                      if (result == null) {
                        setState(() {
                          loading = false;
                          error = 'Please supply a valid email!';
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