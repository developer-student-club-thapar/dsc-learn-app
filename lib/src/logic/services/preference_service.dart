import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>(
  (_) => throw UnimplementedError(),
);

final preferenceServiceProvider = Provider(
  (ref) => PreferenceService(
    sharedPreferences: ref.read(sharedPreferencesProvider),
  ),
);

class PreferenceService {
  const PreferenceService({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  final SharedPreferences _sharedPreferences;

  bool getBool(String key) => _sharedPreferences.getBool(key) ?? false;

  Future<void> setBool(String key, bool value) async =>
      await _sharedPreferences.setBool(key, value);

  int? getInt(String key) => _sharedPreferences.getInt(key);

  Future<void> setInt(String key, int value) async =>
      await _sharedPreferences.setInt(key, value);

  setString(String key, String value) async {
    await _sharedPreferences.setString(key, value);
  }

  String? getString(String key) => _sharedPreferences.getString(key);

  void clear(String key) => _sharedPreferences.remove(key);

  Future<void> reload() => _sharedPreferences.reload();

  void clearAllPreferences() async {
    await _sharedPreferences.clear();
  }

  static const notifcationCount = 'notification_count';
}
