import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zoho_clone/models/attendence.dart';

class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Create a private getter for the collection reference
  CollectionReference<Map<String, dynamic>> get _attendanceCollection =>
      _firestore.collection('attendence');

  Future<List<Attendance>> getAttendance(String userId) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await _attendanceCollection.doc(userId).get();

      if (snapshot.exists && snapshot.data() != null) {
        Map<String, dynamic> snapshotData = snapshot.data()!;
        return snapshotData.entries.map((entry) {
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
      await _attendanceCollection.doc(userId).set(
            attendance.toJson(),
            SetOptions(merge: true), // Merges with existing data
          );
    } catch (e) {
      print('Error adding attendance: $e');
      rethrow;
    }
  }
}
