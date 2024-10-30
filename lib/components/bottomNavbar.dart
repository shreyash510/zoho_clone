import 'package:flutter/material.dart';
import 'package:zoho_clone/pages/approvals/approvals.dart';
import 'package:zoho_clone/pages/more/more.dart';
import 'package:zoho_clone/pages/home/home.dart';
import 'package:zoho_clone/pages/login.dart';
import 'package:zoho_clone/pages/services/service.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 1;

  // Updated icons and added screens in the list
  static List _widgetOptions = [
    ServiceScreen(),
    HomeScreen(),
    LoginScreen(), // This will act as the central "Add" button
    ApprovalsScreen(),
    MoreScreen(),
  ];

  void _onItemTapped(int index) {
    if (index == 2) {
      // Show modal when the middle button is tapped
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
                  _quickActionModal(context),
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
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            // First icon - Services
            _buildNavItem(
                icon: Icons.grid_view_rounded, label: 'Services', index: 0),

            // Second icon - Home
            _buildNavItem(icon: Icons.home_outlined, label: 'Home', index: 1),

            // Spacer for central button
            const SizedBox(width: 40), // Added spacer for middle button

            // Fourth icon - Approvals
            _buildNavItem(
                icon: Icons.task_alt_outlined, label: 'Approvals', index: 3),

            // Fifth icon - More
            _buildNavItem(icon: Icons.more_horiz, label: 'More', index: 4),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(50), // 50% border radius for circular shape
        ),
        onPressed: () => _onItemTapped(2),
        child:
            Icon(Icons.add, size: 30, color: Colors.black), // Central "+" icon
        backgroundColor: Colors.white, // White background for central button
        elevation: 2,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildNavItem(
      {required IconData icon, required String label, required int index}) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 30, // Icon size adjusted to match design
            color: _selectedIndex == index
                ? Colors.blue
                : Colors.black54, // Active color blue, inactive grey
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 12, // Adjusted font size for labels
              color: _selectedIndex == index ? Colors.blue : Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}

Widget _quickActionModal(BuildContext context) {
  double iconSize = MediaQuery.of(context).size.width > 400 ? 30 : 20;
  double fontSize = MediaQuery.of(context).size.width > 400 ? 14 : 12;

  return Container(
    margin: EdgeInsets.all(20),
    child: GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      children: [
        _quickActionCard('Status', Icons.info, Colors.blue, iconSize, fontSize),
        _quickActionCard(
            'Leave', Icons.beach_access, Colors.orange, iconSize, fontSize),
        _quickActionCard(
            'TimeLog', Icons.update, Colors.purple, iconSize, fontSize),
        _quickActionCard('Leave', Icons.leave_bags_at_home, Colors.purple,
            iconSize, fontSize),
      ],
    ),
  );
}

Widget _quickActionCard(String label, IconData icon, Color color,
    double iconSize, double fontSize) {
  return Card(
    elevation: 2,
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
            size: iconSize,
            color: color,
          ),
          SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  );
}
