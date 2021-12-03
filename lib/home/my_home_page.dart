import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:utopia_mobile/shared/widgets/bet_widget.dart';
import 'package:utopia_mobile/shared/widgets/hour_widget.dart';
import 'package:utopia_mobile/shared/widgets/my_loading_button_widget.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  final RoundedLoadingButtonController _btnController = RoundedLoadingButtonController();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 35.0, left: 25.0, right: 25.0, bottom: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 60.0,
                      width: 60.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: Colors.black26,
                          width: 1.5,
                        )
                      ),
                      child: Icon(
                        Icons.arrow_back,
                        size: 30,
                        color: Colors.black.withOpacity(0.70),
                      ),
                    ),
                    Container(
                      height: 60.0,
                      width: 60.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: Colors.black26,
                            width: 1.5,
                          )
                      ),
                      child: Icon(
                        Icons.shopping_basket_outlined,
                        size: 30,
                        color: Colors.black.withOpacity(0.70),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(200),
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider("https://static.actu.fr/uploads/2016/03/JOUR-03_VUE_FINALE_BD.jpg"),
                    )
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Text(
                'Utopia_mobile',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                child: Text("text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic",
                  style: TextStyle(
                    letterSpacing: 0.5,
                    height: 1.5
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HourWidget(
                    hour: "02",
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  const Text(':',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                        color: Colors.black54
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  HourWidget(
                    hour: "02",
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  const Text(':',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                        color: Colors.black54
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  HourWidget(
                    hour: "02",
                  ),
                ],
              ),
              const SizedBox(
                height: 40.0,
              ),
              const Text(
                "Résultat 🤝",
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 25.0, vertical: 30.0,
                ),
                child: BetWidget(
                  etheurumPrice:"0.010",
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 25.0, vertical: 30.0,
                ),
                child: MyLoadingButtonWidget(
                  btnController: widget._btnController,
                  press: () => startLoading(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void startLoading() async {
    // _btnController.start();
    Timer(Duration(seconds: 3), () {
      widget._btnController.success();
    });
  }
}



