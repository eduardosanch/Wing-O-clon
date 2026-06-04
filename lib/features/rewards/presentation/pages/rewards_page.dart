import 'package:flutter/material.dart';

class RewardsPage extends StatelessWidget {
  const RewardsPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Rewards"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            Container(

              height: 200,

              decoration: BoxDecoration(
                color: const Color(0xFF0D3B4C),
                borderRadius: BorderRadius.circular(20),
              ),

              child: const Center(
                child: Text(
                  "1200 Puntos",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            Container(

              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: const Color(0xFF0D3B4C),
                borderRadius: BorderRadius.circular(20),
              ),

              child: const Column(
                children: [

                  Text(
                    "🎁 Canjea premios",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),

                  SizedBox(height: 15),

                  Text(
                    "Obtén hamburguesas, alitas y bebidas gratis.",
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("✓ Visita registrada exitosamente"),
                      backgroundColor: Color(0xFF0A6C74),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0A6C74),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Registrar visita",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
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