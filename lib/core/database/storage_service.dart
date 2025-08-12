
import 'package:water_reminder_app/shared/models/user_data.dart';

abstract class StorageService {
  void init();

  bool get hasInitialized;

  Future<bool> remove(String key);

  Future<Object?> get(String key);

  Future<bool> set(String key, String data);

  Future<void> clear();

  Future<bool> has(String key);

  Future<bool> setUser(UserData user);

  Future<UserData> getUser();
}
