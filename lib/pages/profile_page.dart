import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final Map<String, String>? userData;

  const ProfilePage({super.key, this.userData});

  @override
  Widget build(BuildContext context) {
    final username = userData?['username'] ?? 'Tamu';
    final email = userData?['email'] ?? '-';

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Avatar Besar
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.deepPurple.withOpacity(0.2),
                    blurRadius: 20,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: const CircleAvatar(
                radius: 60,
                backgroundColor: Colors.deepPurple,
                child: Icon(Icons.person, size: 80, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),

            // Nama User
            Text(
              username,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),

            // Email (Menggantikan Password)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade50,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.email, size: 16, color: Colors.deepPurple),
                  const SizedBox(width: 8),
                  Text(
                    email,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.deepPurple,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // Info Tambahan (Opsional)
            const Card(
              elevation: 2,
              child: ListTile(
                leading: Icon(Icons.verified_user, color: Colors.green),
                title: Text('Status Akun'),
                subtitle: Text('Terverifikasi'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
