import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zoho_clone/models/attendence.dart';
import 'package:zoho_clone/models/user.dart';
import 'package:zoho_clone/provider/user_provider.dart';
import 'package:zoho_clone/services/user_services.dart';

// Provider to manage user attendance as a map
final attendanceProvider =
    StateNotifierProvider<AttendanceNotifier, Map<String, Attendance>>(
  (ref) => AttendanceNotifier(ref),
);

class AttendanceNotifier extends StateNotifier<Map<String, Attendance>> {
  final Ref _ref;
  final _userServices = new UserService();

  AttendanceNotifier(this._ref) : super({});

  Future<void> fetchUserAttendanceByUserId(String userId) async {
    User? currentUser = _ref.read(userProvider);

    if (currentUser == null) {
      throw Exception('User is not logged in');
    }

    try {
      List<Attendance> attendanceList =
          await _userServices.getAttendance(userId);

      if (attendanceList.isEmpty) {
        state = {};
        return;
      } else {
        Map<String, Attendance> attendanceMap = {};
        for (Attendance attendance in attendanceList) {
          attendanceMap[attendance.date] = attendance;
        }

        state = attendanceMap;
      }
    } catch (e) {
      print('Error fetching user attendance: $e');
      rethrow;
    }
  }

  Future<void> updateUserAttendanceByUserId(
      String userId, Attendance userAttendanceData, String date) async {
    try {
      User? currentUser = _ref.read(userProvider);
      if (currentUser == null) {
        throw Exception('User is not logged in');
      }

      await _userServices.updateAttendence(userId, userAttendanceData, date);
    } catch (e) {
      print('Error updating user attendance: $e');
      rethrow;
    }
  }
}
