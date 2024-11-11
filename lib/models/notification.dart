class Notifications {
  final String title;
  final String description;

  Notifications({required this.title, required this.description});

  factory Notifications.fromJson(Map<String, dynamic> json) {
    return Notifications(
      title: json['title'] as String,
      description: json['description'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
    };
  }

  Notifications copyWith({
    String? newTitle,
    String? newDescription,
  }) {
    return Notifications(
      title: newTitle ?? this.title,
      description: newDescription ?? this.description,
    );
  }
}
