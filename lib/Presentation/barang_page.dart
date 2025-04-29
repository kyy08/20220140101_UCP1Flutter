import 'package:flutter/material.dart';
import 'package:ucp1_flutter_20220140101/Presentation/detail_barang_page.dart';

class BarangPage extends StatefulWidget {
  const BarangPage({super.key});

  @override
  State<BarangPage> createState() => _BarangPageState();
}

class _BarangPageState extends State<BarangPage> {
  final _formKey = GlobalKey<FormState>();
  final tanggalTransaksiController = TextEditingController();
  final jumlahBarangController = TextEditingController();
  final hargaSatuanController = TextEditingController();

  final Map<String, int> hargaBarang = {
    'Carrier': 1500000,
    'Sleeping Bag': 500000,
    'Tenda': 2500000,
    'Sepatu': 1000000,
  };

  String? _jenisTransaksi;
  String? _jenisBarang;
  DateTime? _selectedDate;

  InputDecoration buildInputDecoration(
    String hintText, {
    Widget? prefixIcon,
    Widget? prefix,
    String? prefixText,
  }) {
    return InputDecoration(
      hintText: hintText,
      prefixIcon: prefixIcon,
      prefix: prefix,
      prefixText: prefixText,
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        tanggalTransaksiController.text =
            "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}";
      });
    }
  }

  @override
  void dispose() {
    tanggalTransaksiController.dispose();
    jumlahBarangController.dispose();
    hargaSatuanController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEF7F5),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Pendataan Barang',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              const Text(
                'Tanggal Transaksi',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              InkWell(
                onTap: _selectDate,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.calendar_today, size: 20),
                      const SizedBox(width: 8),
                      Text(
                        tanggalTransaksiController.text.isEmpty
                            ? 'Pilih tanggal'
                            : tanggalTransaksiController.text,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _jenisTransaksi,
                items: const [
                  DropdownMenuItem(
                    value: 'Barang Masuk',
                    child: Text('Barang Masuk'),
                  ),
                  DropdownMenuItem(
                    value: 'Barang Keluar',
                    child: Text('Barang Keluar'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _jenisTransaksi = value;
                  });
                },
                decoration: buildInputDecoration('Jenis Transaksi'),
                validator:
                    (value) => value == null ? 'Pilih jenis transaksi' : null,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _jenisBarang,
                items:
                    hargaBarang.keys.map((String barang) {
                      return DropdownMenuItem<String>(
                        value: barang,
                        child: Text(barang),
                      );
                    }).toList(),
                onChanged: (value) {
                  setState(() {
                    _jenisBarang = value;
                    hargaSatuanController.text = hargaBarang[value].toString();
                  });
                },
                decoration: buildInputDecoration('Jenis Barang'),
                validator:
                    (value) => value == null ? 'Pilih jenis barang' : null,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Jumlah Barang',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: jumlahBarangController,
                          keyboardType: TextInputType.number,
                          decoration: buildInputDecoration('Jumlah Barang'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Jumlah barang wajib diisi';
                            }
                            if (int.tryParse(value) == null ||
                                int.parse(value) <= 0) {
                              return 'Jumlah harus lebih dari 0';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Harga Satuan',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: hargaSatuanController,
                          keyboardType: TextInputType.number,
                          readOnly: true,
                          decoration: buildInputDecoration(
                            'Harga Satuan',
                            prefixText: 'Rp. ',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Harga satuan wajib diisi';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final int jumlahBarang =
                          int.tryParse(jumlahBarangController.text) ?? 0;
                      final int hargaSatuan =
                          int.tryParse(hargaSatuanController.text) ?? 0;
                      final int totalHarga = jumlahBarang * hargaSatuan;

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => DetailBarangPage(
                                tanggal: tanggalTransaksiController.text,
                                jenisTransaksi: _jenisTransaksi ?? '',
                                jenisBarang: _jenisBarang ?? '',
                                jumlahBarang: jumlahBarangController.text,
                                hargaSatuan: hargaSatuanController.text,
                                totalHarga: totalHarga.toString(),
                              ),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    'Submit',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}