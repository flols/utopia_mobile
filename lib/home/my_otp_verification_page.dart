import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:utopia_mobile/shared/widgets/my_loading_button_widget.dart';
import 'package:utopia_mobile/home/my_home_page.dart';

import 'my_home_page.dart';

class MyOtpVerificationPage extends StatefulWidget {
  String numberPhone;
  String verificationId;
  MyOtpVerificationPage(
      {Key? key, required this.numberPhone, required this.verificationId})
      : super(key: key);

  @override
  _MyOtpVerificationPageState createState() => _MyOtpVerificationPageState();
}

class _MyOtpVerificationPageState extends State<MyOtpVerificationPage> {
  final TextEditingController otpFieldController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text('Vous avez reçu un code par sms au numéro ' +
                  widget.numberPhone),
              SizedBox(
                height: 20,
              ),
              Form(
                key: _formKey,
                child: TextFormField(
                  textInputAction: TextInputAction.done,
                  controller: otpFieldController,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  maxLength: 10,
                  validator: (value) => value!.isEmpty
                      ? 'Veuillez renseigner le code OTP envoyé par sms'
                      : null,
                  decoration: InputDecoration(
                      labelText: "Le code OTP envoyé par sms",
                      hintText: "123456"),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 30.0),
                  child: MyLoadingButtonWidget(
                    btnController: _btnController,
                    press: () => verifyOtp(),
                  )),
            ],
          ),
        )),
      ),
    );
  }

  void verifyOtp() async {
    final FormState? form = _formKey.currentState;
    if (form!.validate()) {
      //
      PhoneAuthCredential authCredential = PhoneAuthProvider.credential(
          verificationId: widget.verificationId,
          smsCode: otpFieldController.text);

      Timer(Duration(seconds: 3), () async {
        await FirebaseAuth.instance.signInWithCredential(authCredential);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyHomePage()),
        );

        _btnController.success();
      });
      print('Form is valid');
    } else {
      _btnController.stop();
      print('Form is invalid');
    }
  }
}
