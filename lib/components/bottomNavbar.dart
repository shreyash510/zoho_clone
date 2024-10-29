import 'package:flutter/material.dart';
import 'package:zoho_clone/pages/more/more.dart';
import 'package:zoho_clone/pages/notification/notifications.dart';
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
    MoreScreen.new(),
  ];

  void _onItemTapped(int index) {
    if (index == 2) {
      // Open a modal from the bottom when the middle button is tapped
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 350,
            color: Colors.white,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  _quickActionModal(),
                  // const Text('Bottom Modal Content'),
                  ElevatedButton(
                    child: Icon(
                      Icons.clear,
                      color: Colors.black,
                      size: 24.0,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      );
    } else {
      // Update selected index for other buttons
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            label: '',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.check_box_outlined,
              size: 40,
              // color: Colors.black,
            ),
            label: 'Approve',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.more_horiz,
              size: 40,
              // color: Colors.black,
            ),
            label: 'More',
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

Widget _quickActionModal() {
  return Container(
      margin: EdgeInsets.all(20),
      child: GridView.count(
        shrinkWrap: true, // Important to avoid unbounded height error
        crossAxisCount: 3, // Number of columns in the grid
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        children: [
          _quickActionCard('Status', Icons.info, Colors.blue),
          _quickActionCard(
              'Compensatory leave', Icons.calendar_today, Colors.orange),
          _quickActionCard('Regularisation', Icons.update, Colors.purple),
          _quickActionCard('Timelog', Icons.access_time, Colors.green),
          _quickActionCard('Leave', Icons.beach_access, Colors.teal),
        ],
      ));
}

Widget _quickActionCard(String label, IconData icon, Color color) {
  return Card(
    elevation: 4,
    surfaceTintColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    child: Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 40,
            color: color, // Apply dynamic color
          ),
          SizedBox(height: 8), // Spacing between icon and text
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  );
}
