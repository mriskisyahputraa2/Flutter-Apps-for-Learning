import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Hapus Scaffold dan AppBar
    return const Center(
      child: Text(
        'Ini adalah halaman setting.',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
