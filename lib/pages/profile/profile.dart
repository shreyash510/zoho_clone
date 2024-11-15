import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:zoho_clone/models/user.dart';
import 'package:zoho_clone/provider/user_provider.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 6,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final userDetails = ref.watch(userProvider);

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            'Profile Screen',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _buildProfileHeader(context, userDetails!),
              TabBar(
                isScrollable: true,
                controller: _tabController,
                indicatorColor: Colors.teal,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(text: 'Profile'),
                  Tab(text: 'Team'),
                  Tab(text: 'Leave Tracker'),
                  Tab(text: 'Time Tracker'),
                  Tab(text: 'Attendance'),
                  Tab(text: 'Attendance1'),
                ],
              ),
              SizedBox(
                height: 700, // Set a fixed height for TabBarView
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildProfileTab(userDetails!),
                    _buildTeamTab(),
                    _buildLeaveTrackerTab(),
                    _buildTimeTrackerTab(),
                    _buildAttendanceTab(),
                    _buildAttendanceTab(),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Widget _buildProfileTab(User userDetails) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          _buildProfileDetail('Designation', 'Software Developer'),
          _buildProfileDetail('Employee ID', 'E20028'),
          _buildProfileDetail('Department',
              'Technology Solutions'), // Add more fields as needed
          _buildProfileDetail(
              'Mobile', '09876543234'), // Add more fields as needed
          _buildProfileDetail(
              'Email ID',
              userDetails.email ??
                  "shreyeshkolhe@iconnectsolutions.com"), // Add more fields as needed
          _buildProfileDetail(
              'Availabilities', ''), // Add more fields as needed
          _buildProfileDetail('Shift', 'TGeneral'), // Add more fields as needed
          _buildProfileDetail('Location', 'Pune'), // Add more fields as needed
        ],
      ),
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
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

Widget _buildTeamTab() {
  return Center(child: Text('Team Content'));
}

Widget _buildLeaveTrackerTab() {
  return Center(child: Text('Leave Tracker Content'));
}

Widget _buildTimeTrackerTab() {
  return Center(child: Text('Time Tracker Content'));
}

Widget _buildAttendanceTab() {
  return Center(child: Text('Attendance Content'));
}

Widget _buildProfileHeader(context, User userDetails) {
  return Container(
    padding: EdgeInsets.all(16.0),
    color: Colors.grey[50],
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image:
                  'https://static.vecteezy.com/system/resources/previews/001/840/612/non_2x/picture-profile-icon-male-icon-human-or-people-sign-and-symbol-free-vector.jpg',
            ),
            // Button 1 - Edit (Top Right)
            Positioned(
              top: 60,
              right: 0,
              child: IconButton(
                icon: Icon(Icons.edit, color: Colors.black),
                onPressed: () {
                  Navigator.of(context).pushNamed('/editProfile');
                },
              ),
            ),
            // Button 2 - Upload (Center Right)
            Positioned(
              top: 100,
              right: 0,
              child: IconButton(
                icon: Icon(Icons.camera_alt, color: Colors.black),
                onPressed: () {
                  // Upload button pressed
                },
              ),
            ),
            // Button 3 - Info (Bottom Right)
            Positioned(
              top: 60,
              left: 0,
              child: IconButton(
                icon: Icon(Icons.info, color: Colors.black),
                onPressed: () {
                  // Info button pressed
                },
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Text(
          'Shreyesh Kolhe', // Replace with dynamic name
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          userDetails.email ??
              "shreyeshkolhe@iconnectsolutions.com", // Replace with dynamic email
          style: TextStyle(color: Colors.grey[600]),
        ),
        SizedBox(height: 10),
        Text(
          'Out', // Replace with dynamic status
          style: TextStyle(color: Colors.redAccent, fontSize: 16),
        ),
      ],
    ),
  );
}
