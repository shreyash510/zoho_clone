import 'package:flutter/material.dart';

class Approvaldetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Approval Details'),
      ),
      body: Center(
          child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      // Text Section taking 80% width
                      Expanded(
                        flex: 4, // 4 parts of the total width
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Leave",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              "For Shreyash Kolhe",
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      // CircleAvatar Section taking 20% width
                      Expanded(
                        flex: 1, // 1 part of the total width
                        child: Align(
                          alignment:
                              Alignment.centerRight, // Align to the right
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.grey,
                            child: Icon(Icons.person, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.all(25),
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 24,
                          backgroundImage: AssetImage(
                              'assets/avatar.png'), // Placeholder image
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          'Yoge...',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildProfileDetail('Employee ID', 'Shreyesh Kolhe E20028'),
                  SizedBox(height: 10),
                  _buildProfileDetail('Leave type', 'Work from Home'),
                  SizedBox(height: 10),
                  _buildProfileDetail('Date', 'Fri, Nov 29-2024'),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Slider(
                          value: 1,
                          min: 0,
                          max: 1,
                          onChanged: (value) {},
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  _buildProfileDetail('Total Days Taken', '1 Day(s)'),
                  SizedBox(height: 10),
                  _buildProfileDetail('Team Email ID', '-'),
                  SizedBox(height: 10),
                ],
              ))),
    );
  }

  Widget _buildProfileDetail(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(height: 5),
          Text(
            value,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
