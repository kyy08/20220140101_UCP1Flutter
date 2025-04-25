import 'package:flutter/material.dart';
import 'package:ucp1_flutter_20220140101/Presentation/home_page.dart';


class DetailOrderPage extends StatelessWidget {
  final String makanan;
  final String minuman;
  final String jumlahMakanan;
  final String jumlahMinuman;
  final int totalHarga;

  const DetailOrderPage({
    super.key,
    required this.makanan,
    required this.minuman,
    required this.jumlahMakanan,
    required this.jumlahMinuman,
    required this.totalHarga,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Order Page')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Food Order: $makanan'),
            Text('Drink Order: $minuman'),
            Text('Food QTY Order: $jumlahMakanan'),
            Text('Drink QTY Order: $jumlahMinuman'),
            Text('Total Price: $totalHarga'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage ()),
                  (route) => false,
                );
              },
              child: const Text('Finish Order'),
            ),
          ],
        ),
      ),
    );
  }
}