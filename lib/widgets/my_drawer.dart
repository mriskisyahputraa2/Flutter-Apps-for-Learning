import 'package:flutter/material.dart';
import '../services/auth_service.dart'; // Import AuthService

class MyDrawer extends StatelessWidget {
  final Map<String, String>? userData;
  final Function(int) onItemTapped;

  const MyDrawer({super.key, this.userData, required this.onItemTapped});

  // Fungsi Logout yang Benar (Lewat Service)
  void _handleLogout(BuildContext context) async {
    // 1. Panggil Logout di Service (Hapus Token di Server & HP)
    final authService = AuthService();
    await authService.logout();

    // 2. Cek apakah widget masih aktif sebelum navigasi
    if (context.mounted) {
      // 3. Kembali ke halaman Login dan hapus semua history halaman sebelumnya
      Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Ambil data dari userData yang dikirim dari Main.dart
    final username = userData?['username'] ?? 'Guest';
    final email = userData?['email'] ?? 'guest@example.com';

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              username,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            accountEmail: Text(email), // Email asli dari API
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                username.isNotEmpty ? username[0].toUpperCase() : 'G',
                style: const TextStyle(fontSize: 24, color: Colors.deepPurple),
              ),
            ),
            decoration: const BoxDecoration(color: Colors.deepPurple),
          ),

          // Menu navigasi
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
              onItemTapped(0);
            },
          ),
          ListTile(
            leading: const Icon(Icons.menu_book_rounded), // Icon Buku
            title: const Text('Daftar Buku'), // Ubah Wisata jadi Buku
            onTap: () {
              Navigator.pop(context);
              onItemTapped(1);
            },
          ),
          ListTile(
            leading: const Icon(Icons.grid_view),
            title: const Text('Galeri Buku'),
            onTap: () {
              Navigator.pop(context);
              onItemTapped(2);
            },
          ),
          ListTile(
            leading: const Icon(Icons.person_outline),
            title: const Text('Profile'),
            onTap: () {
              Navigator.pop(context);
              onItemTapped(3);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: const Text('Settings'),
            onTap: () {
              Navigator.pop(context);
              onItemTapped(4);
            },
          ),

          const Divider(),

          ListTile(
            leading: const Icon(Icons.logout, color: Colors.redAccent),
            title: const Text(
              'Logout',
              style: TextStyle(color: Colors.redAccent),
            ),
            onTap: () {
              // Tampilkan konfirmasi logout
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Konfirmasi'),
                  content: const Text('Yakin ingin keluar aplikasi?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Batal'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context); // Tutup dialog
                        _handleLogout(context); // Proses logout
                      },
                      child: const Text(
                        'Ya, Keluar',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
