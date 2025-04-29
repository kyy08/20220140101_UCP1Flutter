import 'package:flutter/material.dart';

class DataPelangganPage extends StatelessWidget {
  const DataPelangganPage({super.key});

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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLabel("Nama Cust"),
              _buildTextField("Nama Cust"),
              const SizedBox(height: 12),

              Row(
                children: [
                  Expanded(child: _buildLabeledField("Email", "Email")),
                  const SizedBox(width: 12),
                  Expanded(child: _buildLabeledField("No Hp", "No Hp")),
                ],
              ),
              const SizedBox(height: 12),

              _buildLabel("Alamat"),
              _buildTextField("Alamat"),
              const SizedBox(height: 12),

              Row(
                children: [
                  Expanded(child: _buildLabeledField("Provinsi", "Provinsi")),
                  const SizedBox(width: 12),
                  Expanded(child: _buildLabeledField("Kode Pos", "Kode Pos")),
                ],
              ),
              const SizedBox(height: 24),

              ElevatedButton(
                onPressed: () {},
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
                onPressed: () {},
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
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
    );
  }

  Widget _buildTextField(String hint) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }

  Widget _buildLabeledField(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel(label),
        const SizedBox(height: 4),
        _buildTextField(hint),
      ],
    );
  }
}
