import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> imagenes = [
      "https://raw.githubusercontent.com/Alvarado-Ingrid-0456/Imagenes-para-Flutter-6to-I-Fecha-11-Feb-2026/refs/heads/main/impresiones.png",
      "https://raw.githubusercontent.com/Alvarado-Ingrid-0456/Imagenes-para-Flutter-6to-I-Fecha-11-Feb-2026/refs/heads/main/utiles.png",
      "https://raw.githubusercontent.com/Alvarado-Ingrid-0456/Imagenes-para-Flutter-6to-I-Fecha-11-Feb-2026/refs/heads/main/libreta.png",
      "https://raw.githubusercontent.com/Alvarado-Ingrid-0456/Imagenes-para-Flutter-6to-I-Fecha-11-Feb-2026/refs/heads/main/arte.png",
      "https://raw.githubusercontent.com/Alvarado-Ingrid-0456/Imagenes-para-Flutter-6to-I-Fecha-11-Feb-2026/refs/heads/main/manualidades.png",
      "https://raw.githubusercontent.com/Alvarado-Ingrid-0456/Imagenes-para-Flutter-6to-I-Fecha-11-Feb-2026/refs/heads/main/regalos.png",
    ];

    final List<String> nombres = [
      "Impresiones",
      "Útiles",
      "Libretas",
      "Arte",
      "Manualidades",
      "Regalos"
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
      drawer: _crearDrawer(context),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue[900],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
          BottomNavigationBarItem(
              icon: Icon(Icons.print), label: "Impresiones"),
        ],
        onTap: (index) {
          if (index == 1) Navigator.pushNamed(context, '/impresiones');
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Center(
              child: Container(
                width: 300,
                height: 150,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.purple, width: 4),
                ),
                child: const Center(
                  child: Text(
                    "Jueves Libretas Escribe 100 Hojas Cuadrícula Al 2x1!!!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.purple,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(imagenes.length, (index) {
                // --- ADAPTACIÓN AQUÍ: AGREGAMOS INKWELL PARA LA CONEXIÓN ---
                return InkWell(
                  onTap: () {
                    if (nombres[index] == "Impresiones") {
                      Navigator.pushNamed(context, '/impresiones');
                    } else if (nombres[index] == "Útiles") {
                      Navigator.pushNamed(context, '/utiles');
                    }
                  },
                  child: Column(
                    children: [
                      Image.network(imagenes[index], height: 60),
                      Text(
                        nombres[index],
                        style: const TextStyle(color: Colors.purple),
                      )
                    ],
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }

  Widget _crearDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue[900]),
            child: const Text('Menú Papelería',
                style: TextStyle(color: Colors.white, fontSize: 24)),
          ),
          ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Inicio'),
              onTap: () => Navigator.pushNamed(context, '/')),
          ListTile(
              leading: const Icon(Icons.print),
              title: const Text('Impresiones'),
              onTap: () => Navigator.pushNamed(context, '/impresiones')),
          ListTile(
              leading: const Icon(Icons.shopping_bag),
              title: const Text('Útiles'),
              onTap: () => Navigator.pushNamed(context, '/utiles')),
          const ListTile(leading: Icon(Icons.book), title: Text('Libretas')),
          const ListTile(leading: Icon(Icons.palette), title: Text('Arte')),
          const ListTile(
              leading: Icon(Icons.card_giftcard), title: Text('Regalos')),
          const Divider(),
          const ListTile(leading: Icon(Icons.person), title: Text('Cuenta')),
          const ListTile(leading: Icon(Icons.logout), title: Text('Cerrar Sesión')),
        ],
      ),
    );
  }
}