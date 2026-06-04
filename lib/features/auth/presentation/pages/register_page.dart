import 'package:flutter/material.dart';

import '../../../../core/api/auth_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() =>
      _RegisterPageState();
}

class _RegisterPageState
    extends State<RegisterPage> {

  final _nameController =
      TextEditingController();

  final _emailController =
      TextEditingController();

  final _phoneController =
      TextEditingController();

  final _passwordController =
      TextEditingController();

  final AuthService _authService =
      AuthService();

  bool _loading = false;

  Future<void> register() async {

    try {

      setState(() {
        _loading = true;
      });

      await _authService.register(
        name: _nameController.text.trim(),
        email: _emailController.text.trim(),
        phone: _phoneController.text.trim(),
        password:
            _passwordController.text.trim(),
      );

      if (!mounted) return;

      ScaffoldMessenger.of(context)
          .showSnackBar(
        const SnackBar(
          content:
              Text("Usuario registrado"),
        ),
      );

      Navigator.pop(context);

    } catch (e) {

      ScaffoldMessenger.of(context)
          .showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );

    } finally {

      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFF021B24),

      appBar: AppBar(
        title: const Text("Registro"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(24),

        child: ListView(
          children: [

            TextField(
              controller: _nameController,

              decoration: const InputDecoration(
                hintText: "Nombre",
                filled: true,
                fillColor: Colors.black54,
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: _emailController,

              decoration: const InputDecoration(
                hintText: "Correo",
                filled: true,
                fillColor: Colors.black54,
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: _phoneController,

              decoration: const InputDecoration(
                hintText: "Teléfono",
                filled: true,
                fillColor: Colors.black54,
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: _passwordController,
              obscureText: true,

              decoration: const InputDecoration(
                hintText: "Contraseña",
                filled: true,
                fillColor: Colors.black54,
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              height: 55,

              child: ElevatedButton(
                onPressed:
                    _loading ? null : register,

                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color(0xFF13B5B1),
                ),

                child: const Text(
                  "Registrarse",
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}