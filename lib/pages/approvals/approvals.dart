import 'package:flutter/material.dart';

class ApprovalsScreen extends StatefulWidget {
  @override
  _ApprovalsScreenState createState() => _ApprovalsScreenState();
}

class _ApprovalsScreenState extends State<ApprovalsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.person),
            iconSize: 25,
            onPressed: () {
              Navigator.of(context).pushNamed('/profile');
            },
          ),
          title: TextButton(
            onPressed: _showBottomSheetModal,
            child: Text(
              'My Approvals',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.filter_alt_outlined),
              onPressed: () {
                // Add filter functionality
              },
            ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(text: "Pending"),
              Tab(text: "Approval"),
              Tab(text: "Rejection"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(
                child: Text(
                    "Pending content here")), // Replace with actual content
            Center(
                child: Text(
                    "Approval content here")), // Replace with actual content
            Center(
                child: Text(
                    "Rejection content here")), // Replace with actual content
          ],
        ),
      ),
    );
  }

  void _showBottomSheetModal() {
    // Show modal when the middle button is tapped
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          height: 100,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _quickActionModal(context),
            ],
          ),
        );
      },
    );
  }

  Widget _quickActionModal(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () {},
          child: Text(
            'My Approvals',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'My Requests',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
        )
      ],
    );
  }
}
