import 'package:flutter/material.dart';
import 'package:utopia_mobile/home/pages/screens/main_page.dart';
import 'package:utopia_mobile/home/pages/screens/projects_page.dart';
import 'package:utopia_mobile/home/pages/screens/roadmape_page.dart';
import 'package:utopia_mobile/home/pages/screens/settings_page.dart';
import 'package:utopia_mobile/home/pages/screens/wallet_page.dart';
import 'package:utopia_mobile/shared/widgets/constants.dart';
import 'package:utopia_mobile/shared/widgets/services/authentication.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Authentication _auth = Authentication();

  PageController _pageController = PageController();
  List<Widget> _screens = [MainPage(), ProjectsPage(), WalletPage(), RoadmapPage(), SettingsPage()];

  int _selectedIndex = 0;
  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // menu ------------------------------------------------------------------ //
      body: PageView(
        controller: _pageController,
        children: _screens,
        onPageChanged: _onPageChanged,
      ),
      bottomNavigationBar: BottomNavigationBar (
        backgroundColor: secondaryColor,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: SizedBox(
              child: IconButton(
                icon: new Image.asset('assets/images/IconLogo/accueil.png',
                  color: _selectedIndex == 0 ? primaryColor : Colors.white,
                ), onPressed: () {  },
              ),
              height: 40,
              width: 40,
            ),
            title: Text("Home",
              style: TextStyle(
                color: _selectedIndex == 0 ? primaryColor : Colors.white,
              ),
            ),
          ),

          BottomNavigationBarItem(
            icon: SizedBox(
              child: IconButton(
                icon: new Image.asset('assets/images/IconLogo/investissement.png',
                  color: _selectedIndex == 1 ? primaryColor : Colors.white,
                ), onPressed: () {  },
              ),
              height: 45,
              width: 45,
            ),
            title: Text("Projects",
              style: TextStyle(
                color: _selectedIndex == 1 ? primaryColor : Colors.white,
              ),
            ),
          ),

          BottomNavigationBarItem(
            icon: SizedBox(
              child: IconButton(
                icon: new Image.asset('assets/images/IconLogo/wallet.png',
                  color: _selectedIndex == 2 ? primaryColor : Colors.white,
                ), onPressed: () {  },
              ),
              height: 40,
              width: 40,
            ),
            title: Text("Wallet",
              style: TextStyle(
                color: _selectedIndex == 2 ? primaryColor : Colors.white,
              ),
            ),
          ),


          BottomNavigationBarItem(
            icon: SizedBox(
              child: IconButton(
                icon: new Image.asset('assets/images/IconLogo/emplacement.png',
                  color: _selectedIndex == 3 ? primaryColor : Colors.white,
                ), onPressed: () {  },
              ),
              height: 45,
              width: 45,
            ),
            title: Text("RoadMap",
              style: TextStyle(
                color: _selectedIndex == 3 ? primaryColor : Colors.white,
              ),
            ),
          ),


          BottomNavigationBarItem(
            icon: SizedBox(
              child: IconButton(
                icon: new Image.asset('assets/images/IconLogo/settings.png',
                  color: _selectedIndex == 4 ? primaryColor : Colors.white,
                ), onPressed: () {  },
              ),
              height: 40,
              width: 40,
            ),
            title: Text("Settings",
              style: TextStyle(
                color: _selectedIndex == 4 ? primaryColor : Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
