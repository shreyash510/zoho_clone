import 'package:flutter/material.dart';

class HomeCards extends StatelessWidget {
  final Widget child;
  HomeCards({required this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 10,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 201, 201, 201)
                .withOpacity(0.2), // Shadow color
            spreadRadius: 2, // How far the shadow spreads
            blurRadius: 5, // Softness of the shadow
            offset: Offset(0, 1), // Changes position of shadow (x, y)
          ),
        ],
      ),
      margin: const EdgeInsets.all(5.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[child],
        ),
      ),
    );
  }
}
