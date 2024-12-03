class Settings {
  final bool isDarkMode;
  final String? currentPage;

  // Constructor
  Settings({required this.isDarkMode, this.currentPage});

  // Factory method to create Settings from JSON
  factory Settings.fromJson(Map<String, dynamic> json) {
    final dateKey = json.keys.first;
    final data = json[dateKey] as Map<String, dynamic>;

    return Settings(
      isDarkMode: data['isDarkMode'] as bool,
      currentPage: data['currentPage'] as String? ??
          '', // Default to empty string if null
    );
  }

  // Method to convert Settings to JSON
  Map<String, dynamic> toJson() {
    return {
      'isDarkMode': isDarkMode,
      'currentPage': currentPage,
    };
  }

  // Method to create a copy with modified properties
  Settings copyWith({
    bool? isDarkMode,
    String? currentPage,
  }) {
    return Settings(
      isDarkMode: isDarkMode ?? this.isDarkMode,
      currentPage: currentPage ?? this.currentPage,
    );
  }
}
