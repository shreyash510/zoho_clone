import 'package:flutter/material.dart';
import 'package:zoho_clone/components/bottomNavbar.dart';
import 'package:zoho_clone/pages/home/components/notifications.dart';
import 'package:zoho_clone/pages/home/home.dart';
import 'package:zoho_clone/pages/login.dart';
import 'package:zoho_clone/pages/profile.dart';
import 'package:zoho_clone/pages/services/service.dart';

class RootContainer extends StatelessWidget {
  final bool isLoggedIn = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Zoho clone",
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.black87),
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            fontFamily: "Poppins",
            useMaterial3: true),
        initialRoute: !isLoggedIn ? "/" : "/login",
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case "/home":
              return MaterialPageRoute(builder: (context) => HomeScreen());
            case "/profile":
              return MaterialPageRoute(builder: (context) => ProfileScreen());
            case "/login":
              return MaterialPageRoute(builder: (context) => LoginScreen());
            case "/notifications":
              return MaterialPageRoute(
                  builder: (context) => NotificationScreen());
            case "/services":
              return MaterialPageRoute(builder: (context) => ServiceScreen());
            default:
              return MaterialPageRoute(
                  builder: (context) => CustomBottomNavigationBar());
          }
        });
  }
}
