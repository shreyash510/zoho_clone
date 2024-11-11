import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zoho_clone/models/notification.dart';
import 'package:zoho_clone/services/notification_services.dart';

final notificationProvider =
    StateNotifierProvider<NotificationNotifier, List<Notifications>?>(
  (ref) => NotificationNotifier(),
);

class NotificationNotifier extends StateNotifier<List<Notifications>?> {
  NotificationNotifier() : super([]);

  Future<List<Notifications>?> getAllNotifications() async {
    final notifications = await NotificationService().getAllNotifications();
    state = notifications;
    return state;
  }
}
