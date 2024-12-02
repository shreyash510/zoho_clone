import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zoho_clone/models/attendence.dart';
import 'package:zoho_clone/provider/attendence_provider.dart';
import 'package:zoho_clone/provider/user_provider.dart';

class TimerCard extends ConsumerStatefulWidget {
  @override
  _TimerCardState createState() => _TimerCardState();
}

class _TimerCardState extends ConsumerState<TimerCard> {
  late Timer _timer;

  int hours = 00;
  int minutes = 00;
  int seconds = 00;
  String date = '';
  bool isPresent = false;
  DateTime now = DateTime.now();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 0), () {
      _handleTimerCheck();
      String currentDate = getFormattedDate(now);
      setState(() {
        date = currentDate;
      });
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Future.microtask(() => _handleTimercheck());
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  // get user Attendence from database
  Future<Attendance?> _getUserAttendence() async {
    final currentUser = ref.watch(userProvider);
    if (currentUser == null) return null;

    await ref
        .read(attendanceProvider.notifier)
        .fetchUserAttendanceByUserId(currentUser.id);

    final attendance = ref.watch(attendanceProvider);
    return attendance[date] ?? null;
  }

  void _handleTimerCheck() async {
    final currentUser = ref.watch(userProvider);
    final userAttendance = await _getUserAttendence();

    // If the user is not present, exit early
    if (userAttendance == null || userAttendance.isPresent == false) {
      _handleAbsentUser(userAttendance);
      return;
    }

    DateTime checkInTime =
        DateTime.fromMillisecondsSinceEpoch(int.parse(userAttendance.checkin))
            .toUtc();

    _startTimer(checkInTime, userAttendance);

    await ref
        .read(attendanceProvider.notifier)
        .fetchUserAttendanceByUserId(currentUser!.id);
  }

  void _startTimer(DateTime checkInTime, dynamic userAttendance) {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      DateTime currentDateTime = DateTime.now().toUtc();
      if (currentDateTime.isAfter(checkInTime)) {
        _updateTimeDifference(checkInTime, currentDateTime, userAttendance);
      }
    });
  }

  void _handleAbsentUser(dynamic userAttendance) {
    DateTime checkInTime =
        DateTime.fromMillisecondsSinceEpoch(int.parse(userAttendance!.checkin))
            .toUtc();
    DateTime currentDateTime = DateTime.now().toUtc();
    if (currentDateTime.isAfter(checkInTime)) {
      _updateTimeDifference(checkInTime, currentDateTime, userAttendance);
    }
    _timer.cancel();
  }

  void _updateTimeDifference(
      DateTime checkInTime, DateTime currentDateTime, dynamic userAttendance) {
    Duration timeStampDiff = currentDateTime.difference(checkInTime);
    setState(() {
      hours = timeStampDiff.inHours;
      minutes = timeStampDiff.inMinutes % 60;
      seconds = timeStampDiff.inSeconds % 60;
      isPresent = userAttendance.isPresent;
    });
  }

  String getFormattedDate(DateTime date) {
    String day = date.day.toString().padLeft(2, '0');
    String month = date.month.toString().padLeft(2, '0');
    String year = date.year.toString();

    return '$day-$month-$year';
  }

  // // handle checkIn checkOut button
  void handleCheckInAndCheckout() async {
    try {
      String formattedDate = getFormattedDate(now);
      final currentUser = ref.watch(userProvider);
      final currentUserAttendance = ref.watch(attendanceProvider);
      // make copy of current user attendance

      if (currentUser == null) {
        return null;
      }

      Attendance? existingAttendance = currentUserAttendance[formattedDate];

      Attendance updatedAttendance = existingAttendance?.copyWith(
            newCheckin: existingAttendance?.checkin ??
                DateTime.now().toUtc().millisecondsSinceEpoch.toString(),
            newCheckout:
                DateTime.now().toUtc().millisecondsSinceEpoch.toString(),
            newIsPresent: existingAttendance?.isPresent != true ? false : true,
          ) ??
          Attendance(
            date: formattedDate,
            checkin: DateTime.now().toUtc().millisecondsSinceEpoch.toString(),
            checkout: DateTime.now().toUtc().millisecondsSinceEpoch.toString(),
            isPresent: existingAttendance?.isPresent != true ? false : true,
          );

      await ref.read(attendanceProvider.notifier).updateUserAttendanceByUserId(
            currentUser.id,
            updatedAttendance, // Send the updated map to the service
            formattedDate,
          );
      _handleTimerCheck();
    } catch (e) {
      print("Error found in _handleCheckInCheckOutBtn : ${e}");
    }
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   backgroundColor: Colors.black,
    //   body: Center(
    String formattedHours = hours.toString().padLeft(2, '0');
    String formattedMinutes = minutes.toString().padLeft(2, '0');
    String formattedSeconds = seconds.toString().padLeft(2, '0');
    return Container(
      // width: 300,
      padding: EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20), // Rounded corners
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Time Boxes
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildTimeBox('$formattedHours'),
                _buildColon(),
                _buildTimeBox("$formattedMinutes"),
                _buildColon(),
                _buildTimeBox("$formattedSeconds"),
              ],
            ),
            SizedBox(height: 20),
            // Divider line
            Container(
              height: 3,
              width: 230,
              color: Colors.grey[700],
            ),
            SizedBox(height: 10),
            // General Time Description
            Text(
              'GENERAL 09:30 AM TO 06:30 PM',
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20),
            // Check-In Button
            isPresent
                ? ElevatedButton(
                    onPressed: handleCheckInAndCheckout,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red, // Button color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 10.0),
                      child: Text(
                        'Check-Out',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                : ElevatedButton(
                    onPressed: handleCheckInAndCheckout,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal, // Button color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 10.0),
                      child: Text(
                        'Check-In',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
    //   ),
    // );
    return Text("Hello, world!");
  }

  Widget _buildTimeBox(String time) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 218, 218, 218),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        time,
        style: TextStyle(
          color: Colors.black,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildColon() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        ":",
        style: TextStyle(
          color: Colors.grey[900],
          fontSize: 24,
        ),
      ),
    );
  }
}
