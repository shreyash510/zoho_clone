import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TimerCard extends StatefulWidget {
  @override
  _TimerCardState createState() => _TimerCardState();
}

class _TimerCardState extends State<TimerCard> {
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   backgroundColor: Colors.black,
    //   body: Center(
    return Container(
      // width: 300,
      padding: EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20), // Rounded corners
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Time Boxes
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildTimeBox("00"),
                _buildColon(),
                _buildTimeBox("00"),
                _buildColon(),
                _buildTimeBox("00"),
              ],
            ),
            SizedBox(height: 20),
            // Divider line
            Container(
              height: 3,
              width: 230,
              color: Colors.grey[700],
            ),
            SizedBox(height: 10),
            // General Time Description
            Text(
              'GENERAL 09:30 AM TO 06:30 PM',
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20),
            // Check-In Button
            ElevatedButton(
              onPressed: () {
                // Add Check-In functionality here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal, // Button color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 30.0, vertical: 10.0),
                child: Text(
                  'Check-In',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    //   ),
    // );
    return Text("Hello, world!");
  }

  Widget _buildTimeBox(String time) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 218, 218, 218),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        time,
        style: TextStyle(
          color: Colors.black,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildColon() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        ":",
        style: TextStyle(
          color: Colors.grey[900],
          fontSize: 24,
        ),
      ),
    );
  }
}
