import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/cart_service.dart';

class CustomBottomNav extends StatelessWidget {

  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return Consumer<CartService>(
      builder: (context, cartService, child) {
        return BottomNavigationBar(

          currentIndex: currentIndex,

          onTap: onTap,

          backgroundColor: const Color(0xFF062F3C),

          selectedItemColor: const Color(0xFF13B5B1),

          unselectedItemColor: Colors.white54,

          items: [

            const BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Inicio",
            ),

            const BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: "Avisos",
            ),

            const BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard),
              label: "Rewards",
            ),

            // Carrito solo aparece si hay items
            if (cartService.hasItems)
              BottomNavigationBarItem(
                icon: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    const Icon(Icons.shopping_cart),
                    Container(
                      padding: const EdgeInsets.all(1),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 16,
                        minHeight: 16,
                      ),
                      child: Text(
                        '${cartService.itemCount}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                label: "Carrito",
              ),
          ],
        );
      },
    );
  }
}