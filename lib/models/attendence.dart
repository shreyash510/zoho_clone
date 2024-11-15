class Attendance {
  final String date;
  final String checkin;
  final String checkout;
  final bool isPresent;

  Attendance(
      {required this.date,
      required this.checkin,
      required this.checkout,
      required this.isPresent});

  factory Attendance.fromJson(Map<String, dynamic> json) {
    // Assuming the date is dynamic and has only one key
    final dateKey = json.keys.first;
    final data = json[dateKey] as Map<String, dynamic>;

    return Attendance(
      date: dateKey,
      checkin: data['checkin'] as String,
      checkout: data['checkout'] as String,
      isPresent: data['isPresent'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      date: {
        'checkin': checkin,
        'checkout': checkout,
        'isPresent': isPresent,
      }
    };
  }

  Attendance copyWith({
    String? newDate,
    String? newCheckin,
    String? newCheckout,
    bool? newIsPresent,
  }) {
    return Attendance(
      date: newDate ?? this.date,
      checkin: newCheckin ?? this.checkin,
      checkout: newCheckout ?? this.checkout,
      isPresent: newIsPresent ?? this.isPresent,
    );
  }
}
