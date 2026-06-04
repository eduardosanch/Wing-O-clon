import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/constants/app_theme.dart';
import 'core/services/cart_service.dart';
import 'features/splash/presentation/pages/splash_page.dart';

void main() {
  runApp(const WingoApp());
}

class WingoApp extends StatelessWidget {
  const WingoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Wing'O",
        theme: AppTheme.darkTheme,
        home: const SplashPage(),
      ),
    );
  }
}