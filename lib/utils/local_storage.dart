import 'package:shared_preferences/shared_preferences.dart';

enum LocalStoregeKey {
  accessToken;

  String get key => switch (this) {
        LocalStoregeKey.accessToken => 'accessToken',
      };

  String get defaultValue => switch (this) {
        LocalStoregeKey.accessToken => '',
      };

  Future<String?> get value async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString(key) ?? defaultValue;
  }

  void update(String value) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setString(key, value);
  }

  void clean() {
    update(defaultValue);
  }
}
