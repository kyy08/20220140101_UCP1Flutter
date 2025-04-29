import 'package:flutter/material.dart';
import 'package:ucp1_flutter_20220140101/Presentation/data_pelanggan.dart';
import 'package:ucp1_flutter_20220140101/Presentation/piket_gudang.dart';
import 'package:ucp1_flutter_20220140101/Presentation/login_page.dart'; 

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // 🔸 Bagian Profil Header (ganti ke merah)
            Container(
              color: Colors.red,
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage('assets/images/Profile.jpg'),
                  ),
                  const SizedBox(width: 12),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Selamat Datang',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      Text(
                        'Admin',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.logout, color: Colors.white),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginPage()),
                      );
                    },
                  ),
                ],
              ),
            ),

            // 🔸 Banner Gambar
            Image.asset(
              'assets/images/banner.jpg',
              width: double.infinity,
              height: 150,
              fit: BoxFit.cover,
            ),

            // 🔸 Menu Grid
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                padding: const EdgeInsets.all(16),
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _menuButton(
                    icon: Icons.group,
                    label: 'Data Piket',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const PiketGudangPage()),
                      );
                    },
                    color: Colors.red,
                  ),
                  _menuButton(
                    icon: Icons.people,
                    label: 'Data Pelanggan',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const DataPelangganPage()),
                      );
                    },
                    color: Colors.blue,

                  ),
                  _menuButton(
                    icon: Icons.inventory_2,
                    label: 'Barang Masuk/Keluar',
                    onTap: () {
                      // Navigasi ke halaman Barang Masuk/Keluar
                    },
                    isFullWidth: true,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _menuButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    required Color color,
    bool isFullWidth = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: isFullWidth ? double.infinity : null,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 36, color: Colors.white),
            const SizedBox(height: 12),
            Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
