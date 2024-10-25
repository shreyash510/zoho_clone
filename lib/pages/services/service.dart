import 'package:flutter/material.dart';

class ServiceScreen extends StatefulWidget {
  @override
  _ServiceScreenState createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Service Page',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  _CardWithIconWithLabel(
                      Icon(Icons.calendar_month,
                          size: 50, color: Colors.blueAccent),
                      "Calendar"),
                  _CardWithIconWithLabel(
                      Icon(Icons.timelapse, size: 50, color: Colors.blue),
                      "Time Tracker")
                ],
              ),
              Row(
                children: [
                  _CardWithIconWithLabel(
                      Icon(Icons.calendar_view_week,
                          size: 50, color: Colors.deepOrange),
                      "Attendance"),
                  _CardWithIconWithLabel(
                      Icon(Icons.file_copy, size: 50, color: Colors.purple),
                      "Files")
                ],
              ),
              Row(
                children: [
                  _CardWithIconWithLabel(
                      Icon(Icons.calendar_view_day,
                          size: 50, color: Colors.blueGrey),
                      "Organization"),
                  _CardWithIconWithLabel(
                      Icon(Icons.book, size: 50, color: Colors.redAccent),
                      "tranning")
                ],
              ),
              Row(
                children: [
                  _CardWithIconWithLabel(
                      Icon(Icons.travel_explore,
                          size: 50, color: Colors.lightBlueAccent),
                      "Travel"),
                  _CardWithIconWithLabel(
                      Icon(Icons.monetization_on,
                          size: 50,
                          color: const Color.fromARGB(255, 255, 179, 0)),
                      "Compensation")
                ],
              ),
              Row(
                children: [
                  _CardWithIconWithLabel(
                      Icon(Icons.announcement,
                          size: 50,
                          color: const Color.fromARGB(255, 28, 142, 255)),
                      "Announcement"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _CardWithIconWithLabel(icon, label) {
    return SizedBox(
      width: 180, // Fixed width
      height: 180, // Fixed height
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10), // Reduced padding inside the card
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Center content vertically
            crossAxisAlignment:
                CrossAxisAlignment.center, // Center content horizontally
            children: [
              icon,
              SizedBox(
                  height: 10), // Reduced vertical space between icon and text
              Text(
                label,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                textAlign:
                    TextAlign.center, // Center text for better presentation
              ),
            ],
          ),
        ),
        margin: EdgeInsets.all(10), // Card margin
      ),
    );
  }
}
