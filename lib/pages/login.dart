import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 80,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.network(
                  "https://seeklogo.com/images/Z/zoho-corporation-logo-E83548B590-seeklogo.com.png",
                  height: 80,
                  width: 130,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Sign Up",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "To access zopo people",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: 'Email Address or Mobile Number',
                  hintStyle: TextStyle(
                    fontSize: 16,
                  )),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                elevation: 0,
                padding: EdgeInsets.symmetric(horizontal: 32),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                print('Login clicked');
              },
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  elevation: 0,
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/home');
                },
                child: SizedBox(
                  width: double.infinity, // 100% width
                  child: Center(
                    // To ensure the text is centered within the button
                    child: Text(
                      'Next',
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                          fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Text(
                  "Sign in Using",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Facebook Icon
                    Container(
                      padding: EdgeInsets.all(
                          8), // Icon padding inside the square container
                      decoration: BoxDecoration(
                        color: Colors.blue, // Background color for Facebook
                        borderRadius:
                            BorderRadius.circular(8), // Rounded corners
                      ),
                      child: Icon(
                        Icons.facebook,
                        color: Colors.white, // Icon color
                        size: 20, // Icon size
                      ),
                    ),
                    SizedBox(width: 4), // Spacing between icons

                    // Apple Icon
                    Container(
                      padding: EdgeInsets.all(
                          8), // Icon padding inside the square container
                      decoration: BoxDecoration(
                        color: Colors.black, // Background color for Apple
                        borderRadius:
                            BorderRadius.circular(8), // Rounded corners
                      ),
                      child: Icon(
                        Icons.apple,
                        color: Colors.white, // Icon color
                        size: 20, // Icon size
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}
