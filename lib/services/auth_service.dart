import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'config.dart'; // Pastikan import config Anda
import '../models/user.dart';

class AuthService {
  // Login ke API Laravel
  Future<bool> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('${Config.baseUrl}/login'),
        headers: {'Accept': 'application/json'},
        body: {'email': email, 'password': password},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        // 1. Simpan Token
        await _saveToken(data['access_token']);

        // 2. Simpan Data User (Nama & Email) agar bisa dipakai di Profile
        //    API login kita tadi mengembalikan object 'user' juga kan?
        if (data['user'] != null) {
          await _saveUser(User.fromJson(data['user']));
        }

        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }

  Future<void> logout() async {
    // Hapus semua data di HP
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  Future<void> _saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  Future<void> _saveUser(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_name', user.name);
    await prefs.setString('user_email', user.email);
  }
}
