import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final Map<String, String>? userData;

  const HomePage({super.key, this.userData});

  @override
  Widget build(BuildContext context) {
    final username = userData?['username'] ?? 'Teman';

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.deepPurple.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.waving_hand_rounded,
              size: 80,
              color: Colors.deepPurple[300],
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Selamat Datang,\n$username!',
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              'Aplikasi Perpustakaan Terintegrasi Laravel API.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
