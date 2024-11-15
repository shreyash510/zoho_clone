class User {
  final String id;
  final String email;
  final dynamic details;

  User({required this.id, required this.email, this.details});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json["id"] as String,
        email: json['email'] as String,
        details: json["other_details"] as dynamic);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      'email': email,
      'details': details,
    };
  }

  User copyWith({
    String? newId,
    String? newEmail,
    dynamic? newDetails,
  }) {
    return User(
      id: newId ?? this.id,
      email: newEmail ?? this.email,
      details: newDetails ?? this.details,
    );
  }
}
