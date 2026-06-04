import 'package:flutter/material.dart';

import '../../../../core/api/user_service.dart';
import '../../../../core/models/user_model.dart';
import '../../../../core/storage/session_manager.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() =>
      _ProfilePageState();
}

class _ProfilePageState
    extends State<ProfilePage> {

  final UserService _userService =
      UserService();

  UserModel? user;

  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  Future<void> loadUser() async {

    try {

      final userId =
          await SessionManager.getUserId();

      if (userId == null) {
        return;
      }

      final response =
          await _userService.getUser(userId);

      if (!mounted) return;

      setState(() {
        user = response;
        loading = false;
      });

    } catch (e) {

      if (!mounted) return;

      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    if (loading) {

      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(

      appBar: AppBar(
        title: const Text("Perfil"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            const CircleAvatar(
              radius: 50,
              child: Icon(
                Icons.person,
                size: 50,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              user?.name ?? "Usuario",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              user?.email ?? "",
              style: const TextStyle(
                color: Colors.white70,
              ),
            ),

            const SizedBox(height: 40),

            Container(

              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: const Color(0xFF0D3B4C),
                borderRadius:
                    BorderRadius.circular(20),
              ),

              child: Column(
                children: [

                  ListTile(
                    leading: const Icon(
                      Icons.phone,
                      color: Colors.white,
                    ),
                    title: Text(
                      user?.phone ?? "",
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),

                  ListTile(
                    leading: const Icon(
                      Icons.stars,
                      color: Colors.amber,
                    ),
                    title: Text(
                      "${user?.points ?? 0} puntos",
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton.icon(
              onPressed: () async {

                await SessionManager.logout();

                if (!context.mounted) return;

                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/',
                  (route) => false,
                );
              },
              icon: const Icon(Icons.logout),
              label: const Text(
                "Cerrar Sesión",
              ),
            ),
          ],
        ),
      ),
    );
  }
}