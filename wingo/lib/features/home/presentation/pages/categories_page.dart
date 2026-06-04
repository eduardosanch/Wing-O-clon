import 'package:flutter/material.dart';

import 'combos_pague.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  Widget _buildPromotionCard(String imagePath, String title) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[300],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: const Color(0xFF0D3B4C),
              child: Center(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    final categories = [
      "Alitas",
      "Hamburguesas",
      "Boneless",
      "Papas",
      "Bebidas",
    ];

    return Scaffold(

      appBar: AppBar(
        title: const Text("Categorías"),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            // Barra de búsqueda
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Buscar categorías...",
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.grey[50],
                ),
              ),
            ),

            // Pasarela horizontal de promociones
            SizedBox(
              height: 180,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  _buildPromotionCard("assets/images/promo1.jpg", "Promo 1"),
                  _buildPromotionCard("assets/images/promo2.jpg", "Promo 2"),
                  _buildPromotionCard("assets/images/promo3.jpg", "Promo 3"),
                  _buildPromotionCard("assets/images/promo1.jpg", "Promo 4"),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Grid de categorías
            GridView.builder(
              padding: const EdgeInsets.all(20),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: categories.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              itemBuilder: (_, index){
                
                final categoryName = categories[index].toLowerCase();
                final imagePath = 'assets/images/comida/$categoryName.png';

                return GestureDetector(

                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const CombosPage(),
                      ),
                    );
                  },

                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF0D3B4C),
                      borderRadius: BorderRadius.circular(20),
                    ),

                    child: Column(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                            child: Image.asset(
                              imagePath,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: const Color(0xFF0D3B4C),
                                  child: Center(
                                    child: Text(
                                      categories[index],
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(12),
                          color: const Color(0xFF0D3B4C),
                          child: Text(
                            categories[index],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}