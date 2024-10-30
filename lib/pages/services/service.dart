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
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Service Page',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            _CardWithIconWithLabel(
              Icon(Icons.calendar_month, size: 50, color: Colors.blueAccent),
              "Calendar",
            ),
            _CardWithIconWithLabel(
              Icon(Icons.timelapse, size: 50, color: Colors.blue),
              "Time Tracker",
            ),
            _CardWithIconWithLabel(
              Icon(Icons.calendar_view_week,
                  size: 50, color: Colors.deepOrange),
              "Attendance",
            ),
            _CardWithIconWithLabel(
              Icon(Icons.file_copy, size: 50, color: Colors.purple),
              "Files",
            ),
            _CardWithIconWithLabel(
              Icon(Icons.calendar_view_day, size: 50, color: Colors.blueGrey),
              "Organization",
            ),
            _CardWithIconWithLabel(
              Icon(Icons.book, size: 50, color: Colors.redAccent),
              "Training",
            ),
            _CardWithIconWithLabel(
              Icon(Icons.travel_explore,
                  size: 50, color: Colors.lightBlueAccent),
              "Travel",
            ),
            _CardWithIconWithLabel(
              Icon(Icons.monetization_on,
                  size: 50, color: Color.fromARGB(255, 255, 179, 0)),
              "Compensation",
            ),
            _CardWithIconWithLabel(
              Icon(Icons.announcement,
                  size: 50, color: Color.fromARGB(255, 28, 142, 255)),
              "Announcement",
            ),
          ],
        ),
      ),
    );
  }

  Widget _CardWithIconWithLabel(Icon icon, String label) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon,
            SizedBox(height: 10),
            Text(
              label,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
