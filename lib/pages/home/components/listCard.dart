import 'package:flutter/material.dart';

class ListCard extends StatelessWidget {
  final String title;
  final String description;

  // Constructor with optional parameters and default values
  const ListCard({
    Key? key,
    this.title = 'Default Title', // Default value if not provided
    this.description = 'Default Description', // Default value if not provided
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20.0, 0.0, 10.0, 0.0),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey, // Background color for icon
                  borderRadius: BorderRadius.circular(50), // Rounded corners
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.person,
                    size: 30,
                  ),
                ),
              ),
              SizedBox(
                width: 14,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title, // Display the title or default if not provided
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    description, // Display the description or default if not provided
                    style: TextStyle(
                      fontSize: 14,
                      // color: Colors.grey[800],
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
