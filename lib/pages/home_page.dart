import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  // Terima data user melalui konstruktor
  final Map<String, String>? userData;

  const HomePage({super.key, this.userData});

  @override
  Widget build(BuildContext context) {
    final username = userData?['username'];
    final bool isLoggedIn = username != null && username.isNotEmpty;

    // Hapus Scaffold dan AppBar, langsung return kontennya
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.waving_hand_rounded,
            size: 80,
            color: Colors.deepPurple[300],
          ),
          const SizedBox(height: 20),
          Text(
            isLoggedIn ? 'Selamat Datang,\n$username!' : 'Anda belum login.',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          const Text(
            'Gunakan menu di bawah untuk bernavigasi.',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
