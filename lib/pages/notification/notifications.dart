import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zoho_clone/models/notification.dart';
import 'package:zoho_clone/pages/home/components/ListCard.dart';
import 'package:zoho_clone/provider/notification_provider.dart';

class NotificationScreen extends ConsumerStatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends ConsumerState<NotificationScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(notificationProvider.notifier).getAllNotifications();
    });
  }

  @override
  Widget build(BuildContext context) {
    final notifications = ref.watch(notificationProvider);

    ;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notifications",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
      body: notifications == null || notifications.isEmpty
          ? Center(child: CircularProgressIndicator()) // Show loading state
          : ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                // Use your ListCard widget to display each notification
                return ListCard(
                  title: notifications[index].title, // Pass title
                  description:
                      notifications[index].description, // Pass description
                );
              },
            ),
    );
  }
}
