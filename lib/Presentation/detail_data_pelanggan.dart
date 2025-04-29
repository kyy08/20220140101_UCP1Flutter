import 'package:flutter/material.dart';
import 'home_page.dart'; // Ganti path ini jika lokasi HomePage berbeda

class DetailPelangganPage extends StatelessWidget {
  final String nama;
  final String email;
  final String noHp;
  final String alamat;
  final String provinsi;
  final String kodePos;

  const DetailPelangganPage({
    super.key,
    required this.nama,
    required this.email,
    required this.noHp,
    required this.alamat,
    required this.provinsi,
    required this.kodePos,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEF8F6),
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Detail Pelanggan'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 48,
              backgroundColor: Color(0xFFD8D0FF),
              backgroundImage: AssetImage('assets/images/Profile.jpg'),
            ),
            const SizedBox(height: 16),
            Text(nama, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(email, style: const TextStyle(fontSize: 14)),
            Text(noHp, style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 24),

            _buildReadOnlyField("Alamat", alamat),
            const SizedBox(height: 20),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _buildReadOnlyField("Provinsi", provinsi)),
                const SizedBox(width: 12),
                Expanded(child: _buildReadOnlyField("Kode Pos", kodePos)),
              ],
            ),

            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                'Selesai',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReadOnlyField(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Text(
            value,
            style: const TextStyle(fontSize: 14),
          ),
        ),
      ],
    );
  }
}
