import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/services/cart_service.dart';

class ComboDetailPage extends StatefulWidget {
  const ComboDetailPage({super.key});

  @override
  State<ComboDetailPage> createState() => _ComboDetailPageState();
}

class _ComboDetailPageState extends State<ComboDetailPage> {

  bool fries = false;
  bool soda = false;
  bool extraSauce = false;

  String sauce = "BBQ";
  String? friesSize;
  String? selectedSoda;

  void _showFriesSizeDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF0D3B4C),
          title: const Text(
            "Selecciona tamaño de papas",
            style: TextStyle(color: Colors.white),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text(
                  "Papas Pequeñas",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  setState(() {
                    friesSize = "Pequeñas";
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text(
                  "Papas Medianas",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  setState(() {
                    friesSize = "Medianas";
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text(
                  "Papas Grandes",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  setState(() {
                    friesSize = "Grandes";
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showSodaDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF0D3B4C),
          title: const Text(
            "Selecciona bebida",
            style: TextStyle(color: Colors.white),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text(
                  "Coca-Cola",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  setState(() {
                    selectedSoda = "Coca-Cola";
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text(
                  "Sprite",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  setState(() {
                    selectedSoda = "Sprite";
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text(
                  "Fanta Naranja",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  setState(() {
                    selectedSoda = "Fanta Naranja";
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text(
                  "Fanta Uva",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  setState(() {
                    selectedSoda = "Fanta Uva";
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text(
                  "Powerade",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  setState(() {
                    selectedSoda = "Powerade";
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Personaliza tu combo"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: ListView(
          children: [

            const Text(
              "Selecciona salsa",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
              ),
            ),

            const SizedBox(height: 15),

            DropdownButton<String>(
              value: sauce,
              dropdownColor: const Color(0xFF0D3B4C),
              items: const [
                DropdownMenuItem(
                  value: "BBQ",
                  child: Text("BBQ"),
                ),
                DropdownMenuItem(
                  value: "Buffalo",
                  child: Text("Buffalo"),
                ),
                DropdownMenuItem(
                  value: "Mango Habanero",
                  child: Text("Mango Habanero"),
                ),
              ],
              onChanged: (value){
                setState(() {
                  sauce = value!;
                });
              },
            ),

            const SizedBox(height: 30),

            CheckboxListTile(
              value: fries,
              title: const Text(
                "Agregar papas",
                style: TextStyle(color: Colors.white),
              ),
              subtitle: fries && friesSize != null
                  ? Text(
                      "Tamaño: $friesSize",
                      style: const TextStyle(color: Colors.white70),
                    )
                  : null,
              onChanged: (value){
                if (value != null) {
                  setState(() {
                    fries = value;
                  });
                  if (value) {
                    _showFriesSizeDialog();
                  }
                }
              },
            ),

            CheckboxListTile(
              value: soda,
              title: const Text(
                "Agregar bebida",
                style: TextStyle(color: Colors.white),
              ),
              subtitle: soda && selectedSoda != null
                  ? Text(
                      "Seleccionada: $selectedSoda",
                      style: const TextStyle(color: Colors.white70),
                    )
                  : null,
              onChanged: (value){
                if (value != null) {
                  setState(() {
                    soda = value;
                  });
                  if (value) {
                    _showSodaDialog();
                  }
                }
              },
            ),

            CheckboxListTile(
              value: extraSauce,
              title: const Text(
                "Extra salsa",
                style: TextStyle(color: Colors.white),
              ),
              onChanged: (value){
                setState(() {
                  extraSauce = value!;
                });
              },
            ),

            const SizedBox(height: 40),

            SizedBox(
              height: 55,

              child: ElevatedButton(

                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF13B5B1),
                ),

                onPressed: (){
                  final cartService = Provider.of<CartService>(context, listen: false);
                  
                  final item = CartItem(
                    id: DateTime.now().toString(),
                    name: 'Combo',
                    sauce: sauce,
                    fries: fries,
                    friesSize: friesSize,
                    soda: soda,
                    selectedSoda: selectedSoda,
                    extraSauce: extraSauce,
                    price: 249.0,
                  );
                  
                  cartService.addItem(item);
                  
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('✓ Agregado al carrito'),
                      backgroundColor: Color(0xFF0A6C74),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },

                child: const Text(
                  "Agregar al carrito",
                  style: TextStyle(
                    fontSize: 18,
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