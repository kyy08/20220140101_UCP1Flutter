import 'package:flutter/material.dart';
import 'package:ucp1_flutter_20220140101/Presentation/home_page.dart';
import 'package:ucp1_flutter_20220140101/Presentation/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 🔹 Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/walpaper.jpg', // 🔁 Ganti dengan path sesuai gambar kamu
              fit: BoxFit.cover,
            ),
          ),

          // 🔹 Layer isi form login
          Positioned.fill(
            child: Container(
              color: Colors.white.withOpacity(0.85), // Transparansi supaya background masih terlihat
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          const SizedBox(height: 40),

                          // 🔹 Logo
                          Image.asset(
                            'assets/images/logo.jpeg', // 🔁 Ganti dengan file logo kamu
                            height: 120,
                          ),

                          const SizedBox(height: 20),
                          const Text(
                            'SELAMAT DATANG KEMBALI',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 40),

                          Align(
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              'Email',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 4),
                          TextFormField(
                            controller: emailController,
                            validator: (value) =>
                                value!.isEmpty ? 'Silakan masukkan email' : null,
                            decoration: InputDecoration(
                              hintText: 'Email',
                              prefixIcon: const Icon(Icons.email_rounded, color: Colors.brown),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),

                          Align(
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              'Password',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 4),
                          TextFormField(
                            controller: passwordController,
                            obscureText: _obscurePassword,
                            validator: (value) =>
                                value!.isEmpty ? 'Silakan masukkan password' : null,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              prefixIcon: const Icon(Icons.lock, color: Colors.brown),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscurePassword ? Icons.visibility_off : Icons.visibility,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscurePassword = !_obscurePassword;
                                  });
                                },
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          ),
                          const SizedBox(height: 40),

                          // 🔹 Tombol Login
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => const HomePage()),
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.redAccent,
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32),
                                ),
                                elevation: 4,
                              ),
                              child: const Text(
                                'Masuk',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),

                          // 🔹 Link ke register
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Belum memiliki akun? "),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const RegisterPage()),
                                  );
                                },
                                child: const Text(
                                  "Daftar disini!",
                                  style: TextStyle(
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
