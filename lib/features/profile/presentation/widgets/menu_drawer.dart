import 'package:flutter/material.dart';

import '../pages/profile_page.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {

    return Drawer(

      backgroundColor: const Color(0xFF062F3C),

      child: ListView(
        children: [

          UserAccountsDrawerHeader(

            decoration: const BoxDecoration(
              color: Color(0xFF0A6C74),
            ),

            accountName: GestureDetector(

              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ProfilePage(),
                  ),
                );
              },

              child: const Text("Eduardo Sánchez"),
            ),

            accountEmail: const Text("eduardo@email.com"),

            currentAccountPicture: const CircleAvatar(
              child: Icon(Icons.person),
            ),
          ),

          const ListTile(
            leading: Icon(Icons.shopping_bag, color: Colors.white),
            title: Text(
              "Pedidos",
              style: TextStyle(color: Colors.white),
            ),
          ),

          const ListTile(
            leading: Icon(Icons.location_on, color: Colors.white),
            title: Text(
              "Direcciones",
              style: TextStyle(color: Colors.white),
            ),
          ),

          const ListTile(
            leading: Icon(Icons.payment, color: Colors.white),
            title: Text(
              "Métodos de pago",
              style: TextStyle(color: Colors.white),
            ),
          ),

          const ListTile(
            leading: Icon(Icons.help, color: Colors.white),
            title: Text(
              "Ayuda",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}