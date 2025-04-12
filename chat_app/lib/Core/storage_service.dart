
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static const String TOKEN_KEY = 'auth_token';
  static const String USER_ID_KEY = 'user_id';
  static const String IS_LOGGED_IN_KEY = 'is_logged_in';

  // Private constructor for singleton pattern
  StorageService._();
  static final StorageService _instance = StorageService._();

  // Factory constructor to return the same instance
  factory StorageService() => _instance;

  // Shared preferences instance
  SharedPreferences? _prefs;

  // Initialize shared preferences
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Save auth token
  Future<bool> saveToken(String token) async {
    if (_prefs == null) await init();
    return await _prefs!.setString(TOKEN_KEY, token);
  }

  // Get auth token
  String? getToken() {
    return _prefs?.getString(TOKEN_KEY);
  }

  // Remove auth token
  Future<bool> removeToken() async {
    if (_prefs == null) await init();
    return await _prefs!.remove(TOKEN_KEY);
  }

  // Save user ID
  Future<bool> saveUserId(String userId) async {
    if (_prefs == null) await init();
    return await _prefs!.setString(USER_ID_KEY, userId);
  }

  // Get user ID
  String? getUserId() {
    return _prefs?.getString(USER_ID_KEY);
  }

  // Set logged in status
  Future<bool> setLoggedIn(bool value) async {
    if (_prefs == null) await init();
    return await _prefs!.setBool(IS_LOGGED_IN_KEY, value);
  }

  // Check if user is logged in
  bool isLoggedIn() {
    return _prefs?.getBool(IS_LOGGED_IN_KEY) ?? false;
  }

  // Clear all stored data
  Future<bool> clearAll() async {
    if (_prefs == null) await init();
    return await _prefs!.clear();
  }
}