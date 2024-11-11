import 'package:zoho_clone/models/notification.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NotificationService {
  Future<List<Notifications>> getAllNotifications() async {
    try {
      // Fetch data from Firestore with converter
      final querySnapshot = await FirebaseFirestore.instance
          .collection("notifications")
          .withConverter<Notifications>(
            fromFirestore: (snapshots, _) =>
                Notifications.fromJson(snapshots.data()!),
            toFirestore: (Notifications notification, _) =>
                notification.toJson(),
          )
          .get(); // Perform the query to fetch data

      // Map Firestore documents to your Notifications model
      final notifications = querySnapshot.docs
          .map((doc) => doc.data()) // Map to Notifications from Firestore data
          .toList();

      return notifications; // Return the list of notifications
    } catch (e) {
      // Handle any errors here
      print("Error fetching notifications: $e");
      return []; // Return an empty list in case of error
    }
  }
}
