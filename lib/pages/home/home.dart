import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zoho_clone/controllers/home_controller.dart';
import 'package:zoho_clone/pages/home/components/ListCard.dart';
import 'package:zoho_clone/pages/home/components/homeCards.dart';
import 'package:zoho_clone/pages/home/components/timerCard.dart';
import 'package:zoho_clone/provider/attendence_provider.dart';
import 'package:zoho_clone/provider/setting_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final HomeController _homeController = HomeController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final settingsdata = ref.watch(settingsProvider);

    print("settings : ${settingsdata?.isDarkMode}");
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.person),
              iconSize: 25,
              onPressed: () {
                Navigator.of(context).pushNamed('/profile');
              },
            ),
            title: Text(
              'Home Screen',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                iconSize: 25,
                onPressed: () {
                  Navigator.of(context).pushNamed('/services');
                },
              ),
              IconButton(
                icon: Icon(Icons.notifications),
                iconSize: 25,
                onPressed: () {
                  Navigator.of(context).pushNamed('/notifications');
                },
              )
            ]),
        body: AnimatedBuilder(
            animation: _homeController,
            builder: (context, _) {
              return _homeController.isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(height: 10),
                            HomeCards(
                                child:
                                    TimerCard(homeController: _homeController)),
                            HomeCards(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.celebration),
                                        iconSize: 30,
                                        onPressed: () {},
                                      ),
                                      Text(
                                        "Birthday",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  // Center(
                                  //   child: Text("No birthday today!"),
                                  // )
                                  SizedBox(
                                    height: 14,
                                  ),
                                  Container(
                                    child: Column(
                                      children: [
                                        ListCard(), SizedBox(height: 10),
                                        ListCard(), SizedBox(height: 10),
                                        ListCard(), SizedBox(height: 10),
                                        SizedBox(height: 10),
                                        // Check-In Button
                                        ElevatedButton(
                                          onPressed: () {
                                            // Add Check-In functionality here
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors
                                                .grey[500], // Button color
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10.0,
                                                vertical: 2.0),
                                            child: Text(
                                              'View more',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            HomeCards(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.contacts),
                                        iconSize: 30,
                                        onPressed: () {},
                                      ),
                                      Text(
                                        "New hire",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 14,
                                  ),
                                  Container(
                                    child: Column(
                                      children: [
                                        ListCard(), SizedBox(height: 10),
                                        ListCard(), SizedBox(height: 10),
                                        ListCard(), SizedBox(height: 10),

                                        SizedBox(height: 10),
                                        // Check-In Button
                                        ElevatedButton(
                                          onPressed: () {
                                            // Add Check-In functionality here
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors
                                                .grey[500], // Button color
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10.0,
                                                vertical: 2.0),
                                            child: Text(
                                              'View more',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            HomeCards(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.favorite),
                                        iconSize: 30,
                                        onPressed: () {},
                                      ),
                                      Text(
                                        "Favorite",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 14,
                                  ),
                                  Container(
                                    child: Column(
                                      children: [
                                        ListCard(), SizedBox(height: 10),
                                        ListCard(), SizedBox(height: 10),
                                        ListCard(), SizedBox(height: 10),

                                        SizedBox(height: 10),
                                        // Check-In Button
                                        ElevatedButton(
                                          onPressed: () {
                                            // Add Check-In functionality here
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors
                                                .grey[500], // Button color
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10.0,
                                                vertical: 2.0),
                                            child: Text(
                                              'View more',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            HomeCards(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.link),
                                        iconSize: 30,
                                        onPressed: () {},
                                      ),
                                      Text(
                                        "Quick Links",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 14,
                                  ),
                                  Container(
                                    child: Column(
                                      children: [
                                        ListCard(), SizedBox(height: 10),
                                        ListCard(), SizedBox(height: 10),
                                        ListCard(), SizedBox(height: 10),

                                        SizedBox(height: 10),
                                        // Check-In Button
                                        ElevatedButton(
                                          onPressed: () {
                                            // Add Check-In functionality here
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors
                                                .grey[500], // Button color
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10.0,
                                                vertical: 2.0),
                                            child: Text(
                                              'View more',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            HomeCards(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.announcement),
                                        iconSize: 30,
                                        onPressed: () {},
                                      ),
                                      Text(
                                        "Announcement",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 14,
                                  ),
                                  Container(
                                    child: Column(
                                      children: [
                                        ListCard(), SizedBox(height: 10),
                                        ListCard(), SizedBox(height: 10),
                                        ListCard(), SizedBox(height: 10),

                                        SizedBox(height: 10),
                                        // Check-In Button
                                        ElevatedButton(
                                          onPressed: () {
                                            // Add Check-In functionality here
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors
                                                .grey[500], // Button color
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10.0,
                                                vertical: 2.0),
                                            child: Text(
                                              'View more',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            HomeCards(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.report),
                                        iconSize: 30,
                                        onPressed: () {},
                                      ),
                                      Text(
                                        "Leave Report",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 14,
                                  ),
                                  Container(
                                    child: Column(
                                      children: [
                                        ListCard(), SizedBox(height: 10),
                                        ListCard(), SizedBox(height: 10),
                                        ListCard(), SizedBox(height: 10),

                                        SizedBox(height: 10),
                                        // Check-In Button
                                        ElevatedButton(
                                          onPressed: () {
                                            // Add Check-In functionality here
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors
                                                .grey[500], // Button color
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10.0,
                                                vertical: 2.0),
                                            child: Text(
                                              'View more',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            HomeCards(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.holiday_village),
                                        iconSize: 30,
                                        onPressed: () {},
                                      ),
                                      Text(
                                        "Upcoming Holidays",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 14,
                                  ),
                                  Container(
                                    child: Column(
                                      children: [
                                        ListCard(), SizedBox(height: 10),
                                        ListCard(), SizedBox(height: 10),
                                        ListCard(), SizedBox(height: 10),

                                        SizedBox(height: 10),
                                        // Check-In Button
                                        ElevatedButton(
                                          onPressed: () {
                                            // Add Check-In functionality here
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors
                                                .grey[500], // Button color
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10.0,
                                                vertical: 2.0),
                                            child: Text(
                                              'View more',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            )
                          ],
                        ),
                      ),
                    );
            }));
  }
}
