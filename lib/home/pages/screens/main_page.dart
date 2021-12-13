import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:utopia_mobile/shared/widgets/constants.dart';
//import 'package:utopia_mobile/shared/widgets/mainPage/CryptoList.dart';
//import 'package:utopia_mobile/shared/widgets/mainPage/marketPlaceFilterWidget.dart';
//import 'package:utopia_mobile/shared/widgets/mainPage/marketPlaceTitleWidget.dart';
import 'package:utopia_mobile/widgets/constants.dart';
import 'package:utopia_mobile/widgets/mainPage/CryptoList.dart';
import 'package:utopia_mobile/widgets/mainPage/marketPlaceFilterWidget.dart';
import 'package:utopia_mobile/widgets/mainPage/marketPlaceTitleWidget.dart';

import '../../email_authentication/login_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(padding: EdgeInsets.only(top: 10.0)),
            marketPlaceTitle(),
            marketPlaceFilterWidget(),
            CryptoListMain('Bitcoin','BTC', 'assets/images/CryptoLogo/bitcoin.png', r'68560€', '+0.11%'),
            CryptoListMain('Ethereum','ETH', 'assets/images/CryptoLogo/eth.png', r'5728€', '+0.45%'),
            CryptoListMain('BNB','BNB', 'assets/images/CryptoLogo/bnb.png', r'1183€', '+0.23%'),
            CryptoListMain('TetherUS','USDT', 'assets/images/CryptoLogo/tether.png', r'0.99€', '+0.02%'),
            CryptoListMain('Solana','SOL', 'assets/images/CryptoLogo/solana.png', r'171.26€', '+0.84%'),
            CryptoListMain('Cardano','ADA', 'assets/images/CryptoLogo/cardano.png', r'1.34€', '+3.90%'),
            CryptoListMain('Polkadot','DOT', 'assets/images/CryptoLogo/polkadot.png', r'28.78€', '+4.66%'),
            CryptoListMain('Avalanche','AVAX', 'assets/images/CryptoLogo/avalanche.png', r'85.84€', '+3.29%'),
            CryptoListMain('Elrond','EGLD', 'assets/images/CryptoLogo/egld.png', r'216€', '+0.43%'),
            CryptoListMain('Oasis Network','ROSE', 'assets/images/CryptoLogo/rose.png', r'85.84€', '+13.94%'),
            CryptoListMain('The Sandbox','SAND', 'assets/images/CryptoLogo/sand.png', r'216€', '+6.74%'),
          ],
        ),
      ),
    );
  }
}
