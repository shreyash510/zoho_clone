class User {
  final String name;
  final String email;

  User({required this.name, required this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'] as String,
      email: json['email'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
    };
  }

  User copyWith({
    String? newName,
    String? newEmail,
  }) {
    return User(
      name: newName ?? this.name,
      email: newEmail ?? this.email,
    );
  }
}
