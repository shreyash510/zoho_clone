import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zoho_clone/components/bottomNavbar.dart';
import 'package:zoho_clone/pages/approvals/approvals.dart';
import 'package:zoho_clone/pages/notification/notifications.dart';
import 'package:zoho_clone/pages/home/home.dart';
import 'package:zoho_clone/pages/login.dart';
import 'package:zoho_clone/pages/profile/editProfile.dart';
import 'package:zoho_clone/pages/profile/profile.dart';
import 'package:zoho_clone/pages/services/service.dart';
import 'package:zoho_clone/pages/settings/settings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:zoho_clone/provider/setting_provider.dart';
import "package:zoho_clone/provider/user_provider.dart";

class RootContainer extends ConsumerStatefulWidget {
  @override
  _RootContainerState createState() => _RootContainerState();
}

class _RootContainerState extends ConsumerState<RootContainer> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(userProvider.notifier).getCurrentUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    final userDetails = ref.watch(userProvider);
    final settings = ref.watch(settingsProvider);

    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // Check for initialization errors
        if (snapshot.hasError) {
          return Center(
            child: Text("Failed to initialize app: ${snapshot.error}"),
          );
        }

        // If Firebase initialization is complete, render the app
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: "Zoho Clone",
            theme: ThemeData(
              visualDensity: VisualDensity.adaptivePlatformDensity,
              fontFamily: "Poppins",
              useMaterial3: true,
            ),
            darkTheme: ThemeData(
              visualDensity: VisualDensity.adaptivePlatformDensity,
              fontFamily: "Poppins",
              useMaterial3: true,
              brightness: Brightness.dark, // Dark theme brightness
              primaryColor: Colors.teal,
              scaffoldBackgroundColor: Colors.black,
            ),
            themeMode: settings!.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            initialRoute: userDetails?.email != null
                ? "/${settings?.currentPage}"
                : "/login",
            onGenerateRoute: (RouteSettings settings) {
              switch (settings.name) {
                case "/home":
                  return MaterialPageRoute(builder: (context) => HomeScreen());
                case "/profile":
                  return MaterialPageRoute(
                      builder: (context) => ProfileScreen());
                case "/login":
                  return MaterialPageRoute(builder: (context) => LoginScreen());
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
                case "/editProfile":
                  return MaterialPageRoute(
                      builder: (context) => EditProfilePage());
                default:
                  return MaterialPageRoute(
                      builder: (context) => CustomBottomNavigationBar());
              }
            },
          );
        }

        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
