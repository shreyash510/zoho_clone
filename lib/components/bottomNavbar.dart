import 'package:flutter/material.dart';
import 'package:zoho_clone/pages/home/components/notifications.dart';
import 'package:zoho_clone/pages/home/home.dart';
import 'package:zoho_clone/pages/login.dart';
import 'package:zoho_clone/pages/profile.dart';
import 'package:zoho_clone/pages/services/service.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 1;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List _widgetOptions = [
    ServiceScreen.new(),
    HomeScreen.new(),
    LoginScreen.new(),
    ProfileScreen.new(),
    NotificationScreen.new(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('BottomNavigationBar Sample'),
      // ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.auto_awesome_mosaic_rounded,
              size: 40,
              // color: Colors.black,
            ),
            label: 'Services',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.houseboat_outlined,
              size: 40,
              // color: Colors.black,
            ),
            label: 'Home',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_circle_outline,
              size: 40,
              // color: Colors.black,
            ),
            label: 'Business',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.check_box_outlined,
              size: 40,
              // color: Colors.black,
            ),
            label: 'School',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.more_horiz,
              size: 40,
              // color: Colors.black,
            ),
            label: 'Settings',
            backgroundColor: Colors.white,
          ),
        ],
        currentIndex: _selectedIndex,
        // selectedIconTheme: const IconThemeData(
        //     size: 60,
        //     color: Colors.blue), // Custom size and color for selected item
        selectedItemColor: Colors.blue,

        onTap: _onItemTapped,
      ),
    );
  }
}
