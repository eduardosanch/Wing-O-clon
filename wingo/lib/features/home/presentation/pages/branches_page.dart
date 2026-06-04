import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/custom_bottom_nav.dart';
import '../../../../core/services/cart_service.dart';
import 'categories_page.dart';
import 'cart_page.dart';
import '../../../notification/presentation/pages/notifications_page.dart';
import '../../../rewards/presentation/pages/rewards_page.dart';
import '../../../profile/presentation/widgets/menu_drawer.dart';

class BranchesPage extends StatefulWidget {
  const BranchesPage({super.key});

  @override
  State<BranchesPage> createState() => _BranchesPageState();
}

class _BranchesPageState extends State<BranchesPage> {

  int currentIndex = 0;

  void navigateBottomBar(int index) {

    setState(() {
      currentIndex = index;
    });

    if(index == 1){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const NotificationsPage(),
        ),
      );
    }

    if(index == 2){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const RewardsPage(),
        ),
      );
    }

    if(index == 3){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const CartPage(),
        ),
      ).then((_) {
        // Resetear el índice cuando se regresa del carrito
        final cartService = Provider.of<CartService>(context, listen: false);
        if (!cartService.hasItems) {
          setState(() {
            currentIndex = 0;
          });
        }
      });
    }
  }

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

    final branches = [
      "Wing'O Norte",
      "Wing'O Centro",
      "Wing'O Plaza",
    ];

    return Scaffold(

      drawer: const MenuDrawer(),

      appBar: AppBar(
        title: const Text("Bienvenido Eduardo"),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            // Barra de búsqueda
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Buscar promociones...",
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

            // Lista de branches
            ListView.builder(
              padding: const EdgeInsets.all(20),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: branches.length,
              itemBuilder: (_, index){

                return GestureDetector(

                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const CategoriesPage(),
                      ),
                    );
                  },

                  child: Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    height: 180,
                    decoration: BoxDecoration(
                      color: const Color(0xFF0D3B4C),
                      borderRadius: BorderRadius.circular(20),
                    ),

                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          // Logo de la sucursal
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                'assets/icons/logosucursal.png',
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(
                                    Icons.store,
                                    size: 40,
                                    color: Color(0xFF0D3B4C),
                                  );
                                },
                              ),
                            ),
                          ),

                          const SizedBox(width: 15),

                          // Información de la sucursal
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  branches[index],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                const SizedBox(height: 10),

                                Text(
                                  "A domicilio: ${index == 0 ? 'Dentro de zona' : index == 1 ? 'Dentro de zona' : 'Fuera de zona'}",
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 13,
                                  ),
                                ),

                                const SizedBox(height: 5),

                                const Text(
                                  "En sucursal: 20 minutos",
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),

      bottomNavigationBar: CustomBottomNav(
        currentIndex: currentIndex,
        onTap: navigateBottomBar,
      ),
    );
  }
}