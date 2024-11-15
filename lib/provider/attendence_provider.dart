import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zoho_clone/models/attendence.dart';
import 'package:zoho_clone/models/user.dart';
import 'package:zoho_clone/provider/user_provider.dart';

// Provider to manage user attendance as a map
final attendanceProvider =
    StateNotifierProvider<AttendanceNotifier, Map<String, Attendance>>(
  (ref) => AttendanceNotifier(ref),
);

class AttendanceNotifier extends StateNotifier<Map<String, Attendance>> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final Ref _ref;

  AttendanceNotifier(this._ref) : super({});

  Future<void> fetchUserAttendanceByUserId(String userId) async {
    User? currentUser = _ref.read(userProvider);

    if (currentUser == null) {
      throw Exception('User is not logged in');
    }

    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await _firestore.collection('attendence').doc(userId).get();

      if (snapshot.exists && snapshot.data() != null) {
        Map<String, dynamic> data = snapshot.data()!;
        var dataSnapshot = data.entries;

        // Ensure all entries are non-null and properly formatted before parsing
        Map<String, Attendance> attendanceMap = {};
        for (var entry in dataSnapshot) {
          if (entry.value != null &&
              entry.value is Map<String, dynamic> &&
              entry.value['isPresent'] != null) {
            String dataKey = entry.key;
            dynamic dataValue = entry.value;

            try {
              attendanceMap[dataKey] =
                  Attendance.fromJson({dataKey: dataValue});
            } catch (e) {
              print('Error parsing entry for ${entry.key}: $e');
            }
          } else {
            print('Invalid or null entry for key ${entry.key}');
          }
        }

        state = attendanceMap;
      } else {
        state = {};
      }
    } catch (e) {
      print('Error fetching user attendance: $e');
      rethrow;
    }
  }
}
