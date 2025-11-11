import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import untuk login

import 'pages/login_page.dart';
import 'main_page.dart';

// Hapus inisialisasi AppDatabase global di sini.

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi dengan Navigasi',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // Menggunakan _AuthChecker sebagai home/rute awal
      home: const _AuthChecker(),
      routes: {
        '/main': (context) => const MainPage(),
        '/login': (context) => const LoginPage(),
      },
    );
  }
}

// Widget untuk mengecek status autentikasi dari Shared Preferences
class _AuthChecker extends StatefulWidget {
  const _AuthChecker();

  @override
  State<_AuthChecker> createState() => __AuthCheckerState();
}

class __AuthCheckerState extends State<_AuthChecker> {
  Map<String, String>? _userData;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final username = prefs.getString('username');
    final password = prefs.getString('password');

    if (username != null && password != null) {
      setState(() {
        _userData = {'username': username, 'password': password};
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    if (_userData != null) {
      // Menggunakan MainPage dengan data login yang dimuat
      return MainPage(userData: _userData);
    } else {
      return const LoginPage();
    }
  }
}
