import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MoreScreen extends StatefulWidget {
  @override
  _MoreScreenState createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.person),
            iconSize: 25,
            onPressed: () {
              Navigator.of(context).pushNamed('/profile');
            },
          ),
          title: Text(
            'More',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              iconSize: 25,
              onPressed: () {
                Navigator.of(context).pushNamed('/services');
              },
            ),
            IconButton(
              icon: Icon(Icons.settings),
              iconSize: 25,
              onPressed: () {
                Navigator.of(context).pushNamed('/settings');
              },
            )
          ]),
      body: ListView.builder(
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          final item = menuItems[index];
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 2.0),
            child: MenuItem(
              icon: item['icon'] as IconData,
              title: item['title'] as String,
              subItems: item['subItems'] as List<dynamic>,
            ),
          );
        },
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final List<dynamic> subItems;

  const MenuItem(
      {Key? key,
      required this.icon,
      required this.title,
      this.subItems = const []})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (subItems.isEmpty) {
      return ListTile(
        leading: Icon(icon),
        title: Text(title),
        onTap: () {
          // Handle item tap
        },
      );
    } else {
      return Theme(
        data: Theme.of(context).copyWith(
            dividerColor:
                Colors.transparent), // Remove divider between sub-items
        child: ExpansionTile(
          tilePadding: EdgeInsets.symmetric(
              horizontal: 16.0), // Adjust horizontal padding if needed
          leading: Icon(icon),
          title: Text(title),
          childrenPadding: EdgeInsets.only(left: 40), // Indent sub-items
          expandedCrossAxisAlignment:
              CrossAxisAlignment.start, // Align expanded items
          children: subItems
              .map((subItem) => ListTile(
                    dense: true,
                    title: Text(
                      subItem,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    onTap: () {
                      // Handle sub-item tap
                    },
                  ))
              .toList(),
        ),
      );
    }
  }
}

final menuItems = [
  {
    'icon': Icons.feed,
    'title': 'Feeds',
    'subItems': ['My Feeds', 'Department', 'Announcements']
  },
  {
    'icon': Icons.alarm,
    'title': 'Leave Tracker',
    'subItems': ['Views', 'Compensatory Request', 'Holidays']
  },
  {
    'icon': Icons.access_time,
    'title': 'Time Tracker',
    'subItems': ["Time Logs", "Timesheets", "Jobs", "Projects"]
  },
  {
    'icon': Icons.event,
    'title': 'Attendance',
    'subItems': ["My Attendance", "Regularization"]
  },
  {'icon': Icons.folder, 'title': 'Files', 'subItems': []},
  {
    'icon': Icons.business,
    'title': 'Organization',
    'subItems': [
      "View",
      "Thumbs Up",
      "Skills Acquired",
      "Suggestion Box",
      "Employee Profile Form"
    ]
  },
  {
    'icon': Icons.school,
    'title': 'Training',
    'subItems': [
      "Training",
      "Training Registration",
      "Training Feedback",
    ]
  },
  {
    'icon': Icons.travel_explore,
    'title': 'Travel',
    'subItems': ["Travel Request", "Travel Expense"]
  },
  // Compensation
  {
    'icon': Icons.monetization_on,
    'title': 'Compensation',
    'subItems': [
      "Asset",
      "Benefit",
    ]
  },
  // Tasks
  // Announcements
  // Office Readiness
  {'icon': Icons.assignment, 'title': 'Tasks', 'subItems': []},
  {
    'icon': Icons.announcement,
    'title': 'Announcements',
    'subItems': ["Announcement", "Announcement Group"]
  },
  {
    'icon': Icons.star,
    'title': 'Office Readiness',
    'subItems': [
      "Work from office",
      "Visitor at office",
    ]
  }
];
