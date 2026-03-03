import 'package:flutter/material.dart';
import 'misPantallas/inicio.dart';
import 'misPantallas/pantalla2.dart';
import 'misPantallas/pantalla3.dart';


void main() {
  runApp(const MiApp());
}

class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Papelería Cometa',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/impresiones': (context) => const SubirArchivosScreen(),
        '/utiles': (context) => const UtilesPage(),
      },
    );
  }
}