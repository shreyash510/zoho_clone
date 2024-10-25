import 'package:flutter/material.dart';

class ListCard extends StatefulWidget {
  @override
  _ListCardState createState() => _ListCardState();
}

class _ListCardState extends State<ListCard> {
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
                    color: Colors.grey, // Background color for Facebook
                    borderRadius: BorderRadius.circular(50), // Rounded corners
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.person,
                      size: 30,
                    ),
                  )),
              SizedBox(
                width: 14,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "this is test Title",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text("this is test description",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[800],
                      ))
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
