import 'dart:async';

import 'package:balila_mobile/constants/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  void setToken(String token) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(STORAGE_TOKEN, token);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<String?> getToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString(STORAGE_TOKEN);
      return token;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  void removeToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      prefs.remove(STORAGE_TOKEN);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  void setRefreshToken(String token) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(STORAGE_REFRESH_TOKEN, token);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<String?> getRefreshToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString(STORAGE_REFRESH_TOKEN);
      return token;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  void removeRefreshToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      prefs.remove(STORAGE_REFRESH_TOKEN);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  void setConfigTheme(String theme) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(STORAGE_THEME, theme);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<String?> getConfigTheme() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? theme = prefs.getString(STORAGE_THEME);
      return theme;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
