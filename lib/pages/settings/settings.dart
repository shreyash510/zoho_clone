import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool shakeForFeedback = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Settings',
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.power_settings_new, color: Colors.red),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          // Profile Section
          Row(
            children: [
              CircleAvatar(
                radius: 30,
                child: Icon(
                  Icons.person,
                  size: 30,
                ),
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Shreyesh Kolhe',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'shreyeshk@iconnectsolutions.com',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 16),
          // Company Info Section
          ListTile(
            tileColor: Colors.grey[200],
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text(
              'iConnect Info Solutions',
              style: TextStyle(),
            ),
            trailing: Icon(
              Icons.chevron_right,
            ),
            onTap: () {},
          ),
          SizedBox(height: 16),
          // Language Section
          SectionHeader(
            title: 'Language',
          ),
          ListTile(
            title: Text('English', style: TextStyle()),
            trailing: Icon(
              Icons.chevron_right,
            ),
            onTap: () {},
          ),
          SizedBox(height: 16),
          // Privacy & Security Section
          SectionHeader(title: 'Privacy & Security'),
          ListTile(
            title: Text('Privacy Preferences', style: TextStyle()),
            trailing: Icon(
              Icons.chevron_right,
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text('Call Identification', style: TextStyle()),
            trailing: Icon(
              Icons.chevron_right,
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text('App Lock', style: TextStyle()),
            trailing: Icon(
              Icons.chevron_right,
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text('Privacy Policy', style: TextStyle()),
            trailing: Icon(
              Icons.chevron_right,
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text('Terms Of Service', style: TextStyle()),
            trailing: Icon(
              Icons.chevron_right,
            ),
            onTap: () {},
          ),
          SectionHeader(title: 'Other'),
          ListTile(
            title: Text('Take A Tour'),
            trailing: Icon(Icons.chevron_right, color: Colors.white),
            onTap: () {},
          ),
          ListTile(
            title: Text('Rate Us'),
            trailing: Icon(Icons.chevron_right, color: Colors.white),
            onTap: () {},
          ),
          ListTile(
            title: Text('Feedback'),
            trailing: Icon(Icons.chevron_right, color: Colors.white),
            onTap: () {},
          ),
          ListTile(
            title: Text(
              'Shake For Feedback',
            ),
            trailing: Switch(
              value: true,
              onChanged: (value) {
                print(value);
                // setState(() {
                //   shakeForFeedback = value;
                // });
              },
              activeColor: Colors.green,
            ),
          ),
          ListTile(
            title: Text('Siri Shortcuts'),
            trailing: Icon(Icons.chevron_right, color: Colors.white),
            onTap: () {},
          ),
          ListTile(
            title: Text('More Apps'),
            trailing: Icon(Icons.chevron_right, color: Colors.white),
            onTap: () {},
          ),
          SizedBox(height: 16),
          // Account Management Section
          ListTile(
            title: Text(
              'Sync Employee Data',
            ),
            trailing: Icon(Icons.chevron_right, color: Colors.white),
            onTap: () {},
          ),
          ListTile(
            title: Text('Manage Account'),
            trailing: Icon(Icons.chevron_right, color: Colors.white),
            onTap: () {},
          ),
          // Sign Out Button
          ListTile(
            title: Center(
              child: Text(
                'Sign Out',
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            ),
            onTap: () {
              // Handle sign-out
            },
          ),
        ],
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: TextStyle(
            color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
