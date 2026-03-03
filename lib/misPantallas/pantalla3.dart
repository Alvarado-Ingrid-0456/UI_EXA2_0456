import 'package:flutter/material.dart';

class UtilesPage extends StatelessWidget {
  const UtilesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> items = [
  {
    "nombre": "Lápiz", 
    "url": "https://raw.githubusercontent.com/Alvarado-Ingrid-0456/Imagenes-para-Flutter-6to-I-Fecha-11-Feb-2026/refs/heads/main/lapiz.png"
  },
  {
    "nombre": "Juego Geometrico", 
    "url": "https://raw.githubusercontent.com/Alvarado-Ingrid-0456/Imagenes-para-Flutter-6to-I-Fecha-11-Feb-2026/refs/heads/main/juegoG.png"
  },
  {
    "nombre": "Plumas", 
    "url": "https://raw.githubusercontent.com/Alvarado-Ingrid-0456/Imagenes-para-Flutter-6to-I-Fecha-11-Feb-2026/refs/heads/main/plumas.png"
  },
  {
    "nombre": "Borrador", 
    "url": "https://raw.githubusercontent.com/Alvarado-Ingrid-0456/Imagenes-para-Flutter-6to-I-Fecha-11-Feb-2026/refs/heads/main/borrador.png"
  },
  {
    "nombre": "Sacapuntas", 
    "url": "https://raw.githubusercontent.com/Alvarado-Ingrid-0456/Imagenes-para-Flutter-6to-I-Fecha-11-Feb-2026/refs/heads/main/sacapuntas.png"
  },
  {
    "nombre": "Marcadores", 
    "url": "https://raw.githubusercontent.com/Alvarado-Ingrid-0456/Imagenes-para-Flutter-6to-I-Fecha-11-Feb-2026/refs/heads/main/crayola.png"
  },
];

    return Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(
              "https://raw.githubusercontent.com/Alvarado-Ingrid-0456/Imagenes-para-Flutter-6to-I-Fecha-11-Feb-2026/refs/heads/main/logo.jpg",
              height: 40,
            ),
            const SizedBox(width: 8),
            const Text(
              "Papelería Cometa",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text("ÚTILES", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.deepPurple)),
            const SizedBox(height: 20),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, mainAxisSpacing: 20, crossAxisSpacing: 10, childAspectRatio: 0.7),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Expanded(child: Image.network(items[index]["url"]!, fit: BoxFit.cover)),
                    const SizedBox(height: 5),
                    Text(items[index]["nombre"]!, style: const TextStyle(color: Colors.deepPurple)),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}