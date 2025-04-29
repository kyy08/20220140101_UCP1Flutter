import 'package:flutter/material.dart';
import 'package:ucp1_flutter_20220140101/Presentation/detail_tugas_piket.dart';

class PiketGudangPage extends StatefulWidget {
  const PiketGudangPage({super.key});

  @override
  State<PiketGudangPage> createState() => _PiketGudangPageState();
}

class _PiketGudangPageState extends State<PiketGudangPage> {
  final TextEditingController _tanggalController = TextEditingController();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _tugasController = TextEditingController();

  final List<Map<String, String>> _daftarTugas = [];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _tanggalController.text =
            "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  void _tambahTugas() {
    if (_namaController.text.isNotEmpty &&
        _tanggalController.text.isNotEmpty &&
        _tugasController.text.isNotEmpty) {
      setState(() {
        _daftarTugas.add({
          'nama': _namaController.text,
          'tanggal': _tanggalController.text,
          'tugas': _tugasController.text,
        });
        _tugasController.clear(); // reset input tugas
      });
    }
  }

  @override
  void dispose() {
    _tanggalController.dispose();
    _namaController.dispose();
    _tugasController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Piket Gudang'),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Nama Anggota'),
            const SizedBox(height: 8),
            TextField(
              controller: _namaController,
              decoration: InputDecoration(
                hintText: 'Isi Nama Anggota',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 16),
            const Text('Pilih Tanggal'),
            const SizedBox(height: 8),
            TextField(
              controller: _tanggalController,
              readOnly: true,
              decoration: InputDecoration(
                hintText: 'Pilih Tanggal',
                prefixIcon: const Icon(Icons.calendar_today),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              onTap: () => _selectDate(context),
            ),
            const SizedBox(height: 16),
            const Text('Tugas Piket'),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _tugasController,
                    decoration: InputDecoration(
                      hintText: 'Tugas Piket',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _tambahTugas,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text('Tambah'),
                )
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              'Daftar Tugas Piket',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            Expanded(
              child: _daftarTugas.isEmpty
                  ? const Center(child: Text('Belum ada Data'))
                  : ListView.builder(
                      itemCount: _daftarTugas.length,
                      itemBuilder: (context, index) {
                        final tugas = _daftarTugas[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          child: ListTile(
                            leading: const Icon(Icons.assignment),
                            title: Text(tugas['tugas']!),
                            subtitle:
                                Text('${tugas['nama']} - ${tugas['tanggal']}'),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailTugasPiketPage(tugas: tugas),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

// =========================
// Tambahkan ini di file yang sama atau file terpisah
class DetailTugasPage extends StatelessWidget {
  final Map<String, String> tugas;

  const DetailTugasPage({super.key, required this.tugas});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Tugas'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nama: ${tugas['nama']}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text('Tanggal: ${tugas['tanggal']}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text('Tugas: ${tugas['tugas']}', style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
