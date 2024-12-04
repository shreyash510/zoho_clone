import 'package:flutter/material.dart';

class Approvalcard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed('/approvalDetails');
        },
        child: Card(
          child: Row(
            children: <Widget>[
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.grey,
                      child: Icon(Icons.person, color: Colors.white),
                    ),
                  )
                ],
              ),
              SizedBox(width: 16.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Leave type",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      // color: Colors.black,
                    ),
                  ),
                  Text("You have raised a request"),
                  Text(
                    "29-nov-2024",
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal
                        // color: Colors.grey,
                        ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
