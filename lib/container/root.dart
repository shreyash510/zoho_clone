import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zoho_clone/components/bottomNavbar.dart';
import 'package:zoho_clone/pages/approvals/approvals.dart';
import 'package:zoho_clone/pages/notification/notifications.dart';
import 'package:zoho_clone/pages/home/home.dart';
import 'package:zoho_clone/pages/login.dart';
import 'package:zoho_clone/pages/profile.dart';
import 'package:zoho_clone/pages/services/service.dart';
import 'package:zoho_clone/pages/settings/settings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class RootContainer extends StatefulWidget {
  @override
  State<RootContainer> createState() => _RootContainerState();
}

class _RootContainerState extends State<RootContainer> {
  User? user;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    // Listen for auth state changes
    _auth.authStateChanges().listen((User? user) {
      if (user == null) {
        setState(() {
          this.isLoggedIn = false;
        });
      } else {
        setState(() {
          this.user = user;
          this.isLoggedIn = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print('****$user');
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Center(
            child: Text("Failed to initialize app: ${snapshot.error}"),
          );
          ;
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
              title: "Zoho clone",
              theme: ThemeData(
                  colorScheme: ColorScheme.fromSeed(seedColor: Colors.black87),
                  primarySwatch: Colors.blue,
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                  fontFamily: "Poppins",
                  useMaterial3: true),
              initialRoute: isLoggedIn ? "/" : "/login",
              onGenerateRoute: (RouteSettings settings) {
                switch (settings.name) {
                  case "/home":
                    return MaterialPageRoute(
                        builder: (context) => HomeScreen());
                  case "/profile":
                    return MaterialPageRoute(
                        builder: (context) => ProfileScreen());
                  case "/login":
                    return MaterialPageRoute(
                        builder: (context) => LoginScreen());
                  case "/notifications":
                    return MaterialPageRoute(
                        builder: (context) => NotificationScreen());
                  case "/services":
                    return MaterialPageRoute(
                        builder: (context) => ServiceScreen());
                  case "/settings":
                    return MaterialPageRoute(
                        builder: (context) => SettingsScreen());
                  case "/approvals":
                    return MaterialPageRoute(
                        builder: (context) => ApprovalsScreen());
                  default:
                    return MaterialPageRoute(
                        builder: (context) => CustomBottomNavigationBar());
                }
              });
        }
        // return something
        return Container();
      },
    );
  }
}
