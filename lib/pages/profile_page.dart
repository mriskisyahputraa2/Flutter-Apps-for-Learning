import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  // Terima data user melalui konstruktor
  final Map<String, String>? userData;

  const ProfilePage({super.key, this.userData});

  @override
  Widget build(BuildContext context) {
    final username = userData?['username'];
    final password = userData?['password'];

    // Hapus Scaffold dan AppBar, langsung return kontennya
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.account_circle,
              size: 100,
              color: Colors.deepPurple,
            ),
            const SizedBox(height: 20),
            Text(
              'Halo, ${username ?? 'Tamu'}!',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              'Password Anda: ${password ?? 'Tidak ada'}',
              style: const TextStyle(fontSize: 16, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
