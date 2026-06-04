import 'package:flutter/material.dart';

import 'combo_detail_page.dart';

class CombosPage extends StatelessWidget {
  const CombosPage({super.key});

  @override
  Widget build(BuildContext context) {

    final combos = [
      "Combo Familiar",
      "Combo Doble",
      "Combo BBQ",
      "Combo Especial",
    ];

    return Scaffold(

      appBar: AppBar(
        title: const Text("Combos"),
      ),

      body: ListView.builder(

        padding: const EdgeInsets.all(20),

        itemCount: combos.length,

        itemBuilder: (_, index){

          return GestureDetector(

            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const ComboDetailPage(),
                ),
              );
            },

            child: Container(

              margin: const EdgeInsets.only(bottom: 20),

              height: 170,

              decoration: BoxDecoration(
                color: const Color(0xFF0D3B4C),
                borderRadius: BorderRadius.circular(20),
              ),

              child: Padding(
                padding: const EdgeInsets.all(20),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const Spacer(),

                    Text(
                      combos[index],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      "\$249",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}