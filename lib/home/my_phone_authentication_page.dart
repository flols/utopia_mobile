import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:utopia_mobile/shared/widgets/my_loading_button_widget.dart';
import 'package:utopia_mobile/home/my_otp_verification_page.dart';


class MyPhoneAuthenticationPage extends StatefulWidget {
  const MyPhoneAuthenticationPage({Key? key}) : super(key: key);

  @override
  _MyPhoneAuthenticationPageState createState() =>
      _MyPhoneAuthenticationPageState();
}

class _MyPhoneAuthenticationPageState extends State<MyPhoneAuthenticationPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Text("Bonjour"),
                SizedBox(
                  height: 20,
                ),
                Form(
                    key: _formKey,
                    child: TextFormField(
                      textInputAction: TextInputAction.done,
                      controller: phoneNumberController,
                      keyboardType: TextInputType.phone,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      maxLength: 15,
                      validator: (value) => value!.isEmpty
                          ? 'Veuillez renseigner votre numéro de téléphone'
                          : null,
                      decoration: InputDecoration(
                          labelText: "Votre numéro de téléphone",
                          hintText: "+33612121210"),
                    )),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25.0, vertical: 30.0),
                    child: MyLoadingButtonWidget(
                      btnController: _btnController,
                      press: () => signUp(),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void signUp() async {
    final FormState? form = _formKey.currentState;
    if (form!.validate()) {
      Timer(Duration(seconds: 3), () async {
        await FirebaseAuth.instance.setLanguageCode("fr");
        await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: "+33" + phoneNumberController.text,
          verificationCompleted: (PhoneAuthCredential credential) {},
          verificationFailed: (FirebaseAuthException e) {},
          codeSent: (String verificationId, int? resendToken) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MyOtpVerificationPage(
                        numberPhone: phoneNumberController.text,
                        verificationId: verificationId,
                      )),
            );
            _btnController.stop();
          },
          codeAutoRetrievalTimeout: (String verificationId) {},
        );
      });
      print('Form is valid');
    } else {
      _btnController.stop();
      print('Form is invalid');
    }
  }
}
