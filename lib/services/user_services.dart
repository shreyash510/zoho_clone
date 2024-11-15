import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zoho_clone/models/attendence.dart';

class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Attendance>> getAttendance(String userId) async {
    try {
      // Access the 'attendance' collection for the given user
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await _firestore.collection('attendance').doc(userId).get();

      if (snapshot.exists) {
        // Extract data and map it to the Attendance model
        Map<String, dynamic> data = snapshot.data()!;
        return data.entries.map((entry) {
          return Attendance.fromJson({entry.key: entry.value});
        }).toList();
      } else {
        return [];
      }
    } catch (e) {
      print('Error fetching attendance: $e');
      rethrow;
    }
  }

  Future<void> setAttendence(String userId, Attendance attendance) async {
    try {
      await _firestore.collection('attendance').doc(userId).set(
            attendance.toJson(),
            SetOptions(merge: true), // Merges with existing data
          );
    } catch (e) {
      print('Error adding attendance: $e');
      rethrow;
    }
  }
}
