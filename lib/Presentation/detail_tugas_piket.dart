import 'package:flutter/material.dart';

class DetailTugasPiketPage extends StatelessWidget {
  final Map<String, String> tugas;

  const DetailTugasPiketPage({super.key, required this.tugas});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Tugas'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nama Anggota:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(tugas['nama'] ?? '-'),
            SizedBox(height: 16),
            Text('Tanggal:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(tugas['tanggal'] ?? '-'),
            SizedBox(height: 16),
            Text('Tugas:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(tugas['tugas'] ?? '-'),
          ],
        ),
      ),
    );
  }
}
