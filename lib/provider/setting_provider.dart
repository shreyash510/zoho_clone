import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zoho_clone/models/setting.dart';

final settingsProvider = StateNotifierProvider<SettingNotifier, Settings?>(
    (ref) => SettingNotifier());

class SettingNotifier extends StateNotifier<Settings?> {
  SettingNotifier() : super(Settings(isDarkMode: true, currentPage: "/"));

  Settings? getSettings() {
    return state;
  }

  void setSettings(Settings? settings) {
    state = settings;
  }
}
