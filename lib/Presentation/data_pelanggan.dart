import 'package:flutter/material.dart';
import 'package:ucp1_flutter_20220140101/Presentation/detail_data_pelanggan.dart';


class DataPelangganPage extends StatefulWidget {
  const DataPelangganPage({super.key});

  @override
  State<DataPelangganPage> createState() => _DataPelangganPageState();
}

class _DataPelangganPageState extends State<DataPelangganPage> {
  final _formKey = GlobalKey<FormState>();

  final _namaController = TextEditingController();
  final _emailController = TextEditingController();
  final _noHpController = TextEditingController();
  final _alamatController = TextEditingController();
  final _provinsiController = TextEditingController();
  final _kodePosController = TextEditingController();

  void _simpan() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailPelangganPage(
            nama: _namaController.text,
            email: _emailController.text,
            noHp: _noHpController.text,
            alamat: _alamatController.text,
            provinsi: _provinsiController.text,
            kodePos: _kodePosController.text,
          ),
        ),
      );
    }
  }

  void _reset() {
    _formKey.currentState?.reset();
    _namaController.clear();
    _emailController.clear();
    _noHpController.clear();
    _alamatController.clear();
    _provinsiController.clear();
    _kodePosController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEF8F6),
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Data Pelanggan'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildLabel("Nama Cust"),
                _buildTextField("Nama Cust", _namaController),
                const SizedBox(height: 12),

                Row(
                  children: [
                    Expanded(child: _buildLabeledField("Email", "Email", _emailController)),
                    const SizedBox(width: 12),
                    Expanded(child: _buildLabeledField("No Hp", "No Hp", _noHpController)),
                  ],
                ),
                const SizedBox(height: 12),

                _buildLabel("Alamat"),
                _buildTextField("Alamat", _alamatController),
                const SizedBox(height: 12),

                Row(
                  children: [
                    Expanded(child: _buildLabeledField("Provinsi", "Provinsi", _provinsiController)),
                    const SizedBox(width: 12),
                    Expanded(child: _buildLabeledField("Kode Pos", "Kode Pos", _kodePosController)),
                  ],
                ),
                const SizedBox(height: 24),

                ElevatedButton(
                  onPressed: _simpan,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    minimumSize: const Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text('Simpan'),
                ),
                const SizedBox(height: 12),
                OutlinedButton(
                  onPressed: _reset,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.red,
                    side: const BorderSide(color: Colors.red),
                    minimumSize: const Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text('Reset'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
    );
  }

  Widget _buildTextField(String hint, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        filled: true,
        fillColor: Colors.white,
      ),
      validator: (value) => value == null || value.isEmpty ? 'Tidak boleh kosong' : null,
    );
  }

  Widget _buildLabeledField(String label, String hint, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel(label),
        const SizedBox(height: 4),
        _buildTextField(hint, controller),
      ],
    );
  }
}
