import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/profile_page.dart';
import 'pages/setting_page.dart';
import 'pages/list_page.dart';
import 'pages/grid_page.dart';
import 'widgets/my_drawer.dart';
// Hapus import manage_destination_page.dart

class MainPage extends StatefulWidget {
  final Map<String, String>? userData;
  const MainPage({
    super.key,
    this.userData,
  }); // Terima userData dari AuthChecker/Login

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Ambil data dari argument route (jika dari LoginPage)
    final userDataFromRoute =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>?;

    // Prioritas: widget.userData (dari AuthChecker) atau userDataFromRoute (dari LoginPage)
    final userData = widget.userData ?? userDataFromRoute;

    // Daftar widget halaman yang akan ditampilkan di body
    final List<Widget> pages = [
      HomePage(userData: userData),
      const ListPage(), // Index 1
      const GridPage(), // Index 2
      ProfilePage(userData: userData),
      const SettingPage(),
    ];

    // Daftar judul untuk AppBar, sesuai dengan urutan halaman
    final List<String> pageTitles = [
      'Home',
      'Daftar Wisata',
      'Galeri Wisata',
      'Profile',
      'Settings',
    ];

    // FAB DIHAPUS

    return Scaffold(
      appBar: AppBar(title: Text(pageTitles[_selectedIndex]), elevation: 2.0),
      // Kirim data user ke Drawer
      drawer: MyDrawer(userData: userData, onItemTapped: _onItemTapped),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_outlined),
            activeIcon: Icon(Icons.list_alt),
            label: 'Daftar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view),
            activeIcon: Icon(Icons.grid_on),
            label: 'Galeri',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            activeIcon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
      // Hapus floatingActionButton:
      // floatingActionButton: null,
    );
  }
}
