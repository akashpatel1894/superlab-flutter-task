import 'dart:convert';

import 'package:encrypt/encrypt.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefConst {
  static var recentSearchesKey = 'recentSearches';
}

class SharedPrefServices {
  static final SharedPrefServices _instance = SharedPrefServices();
  static Future<SharedPrefServices> getInstance() async {
    return _instance;
  }

  static const String _iv = "16ByteLongIV1234";
  static const String _key = "32CharacterLongEncryptionKey123!";

  late final SharedPreferences _pref;
  late final Encrypter _encrypter;
  late final Key _cipherKey;
  late final IV _initVector;

  Future<void> initialise() async {
    _pref = await SharedPreferences.getInstance();
    _cipherKey = Key.fromUtf8(_key);
    _encrypter = Encrypter(AES(_cipherKey, mode: AESMode.cbc));
    _initVector = IV.fromUtf8(_iv);
  }

  Future<bool> setString(String key, var value) async {
    final encrypted = _encrypter.encrypt(value, iv: _initVector);
    return await _pref.setString(key, encrypted.base64);
  }

  Future<bool> setObjectString(String key, var value) async {
    String objectJson = jsonEncode(value.toJson());
    final encrypted = _encrypter.encrypt(objectJson, iv: _initVector);
    return await _pref.setString(key, encrypted.base64);
  }

  String? getString(String key) {
    final encryptedString = _pref.getString(key);
    if (encryptedString == null) return null;

    final encrypted = Encrypted.fromBase64(encryptedString);
    return _encrypter.decrypt(encrypted, iv: _initVector);
  }

  Future<bool> setBool(String key, bool value) async {
    return await _pref.setBool(key, value);
  }


  bool getBool(String key) {
    return _pref.getBool(key) ?? false;
  }


  Future<bool> removeValue(String key) async {
    return await _pref.remove(key);
  }

  Future<bool> removeAll() async {
    return await _pref.clear();
  }

  Future<void> addRecentSearch(String searchTerm) async {
    final prefs = await SharedPreferences.getInstance();

    List<String> currentSearches = prefs.getStringList(SharedPrefConst.recentSearchesKey) ?? [];

    currentSearches.remove(searchTerm);

    currentSearches.insert(0, searchTerm);

    if (currentSearches.length > 10) {
      currentSearches = currentSearches.sublist(0, 10);
    }

    await prefs.setStringList(SharedPrefConst.recentSearchesKey, currentSearches);
  }

  Future<List<String>> getRecentSearches() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(SharedPrefConst.recentSearchesKey) ?? [];
  }

  Future<void> clearRecentSearches() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(SharedPrefConst.recentSearchesKey);
  }
}