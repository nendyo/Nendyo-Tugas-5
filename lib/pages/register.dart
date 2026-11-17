import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _agreeTerms = false;
  final bool _obscurePassword = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF4F46E5)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Daftar',
          style: TextStyle(
            color: Color(0xFF4F46E5),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Selamat Datang',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E1B4B),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Hi, buat akun baru',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 20),

                // Ilustrasi Handphone / Badge Register
                Center(
                  child: Container(
                    height: 110,
                    width: 110,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFEEF2F6),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        const Icon(
                          Icons.phone_iphone,
                          size: 45,
                          color: Color(0xFF4F46E5),
                        ),
                        Positioned(
                          top: 15,
                          right: 25,
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.indigo,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 30,
                          right: 10,
                          child: Container(
                            width: 10,
                            height: 10,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.redAccent,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          left: 15,
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.amber,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 30,
                          right: 25,
                          child: Container(
                            width: 6,
                            height: 6,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 25),

                // Field Name
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    hintText: 'Masukkan nama',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    filled: true,
                    fillColor: const Color(0xFFF9FAFB),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Field Name tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Field Email
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Masukkan email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    filled: true,
                    fillColor: const Color(0xFFF9FAFB),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Field Email tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Field Password
                TextFormField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Masukkan password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    filled: true,
                    fillColor: const Color(0xFFF9FAFB),
                    suffixIcon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.grey,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Field Password tidak boleh kosong';
                    }
                    if (value.length < 6) {
                      return 'Password minimal memiliki panjang 6 karakter';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),

                // Checkbox Syarat dan Kebijakan
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 24,
                      width: 24,
                      child: Checkbox(
                        value: _agreeTerms,
                        onChanged: (val) {
                          setState(() {
                            _agreeTerms = val ?? false;
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: RichText(
                        text: const TextSpan(
                          text: 'Dengan menekan daftar anda setuju dengan ',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                          children: [
                            TextSpan(
                              text: 'Syarat dan Kebijakan',
                              style: TextStyle(
                                color: Color(0xFF4F46E5),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(text: ' kami'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Tombol Daftar
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4F46E5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushReplacementNamed(context, '/login');
                      }
                    },
                    child: const Text(
                      'Daftar',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Navigasi Kembali ke Login
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: RichText(
                      text: const TextSpan(
                        text: 'Sudah punya akun? ',
                        style: TextStyle(color: Colors.grey),
                        children: [
                          TextSpan(
                            text: 'Masuk',
                            style: TextStyle(
                              color: Color(0xFF4F46E5),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
