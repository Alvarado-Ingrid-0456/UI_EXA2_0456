import 'package:flutter/material.dart';
import 'inicio.dart'; // Importamos el drawer

class SubirArchivosScreen extends StatefulWidget {
  const SubirArchivosScreen({super.key});

  @override
  State<SubirArchivosScreen> createState() => _SubirArchivosScreenState();
}

class _SubirArchivosScreenState extends State<SubirArchivosScreen> {
  int cantidad = 1;
  String? tipoArchivo;
  String? metodoPago;
  String? metodoEntrega;

  final Color moradoSuave = Colors.deepPurple;
  final Color moradoClaro = Colors.deepPurpleAccent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F0FF),
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
      drawer: const MyDrawer(), // Menú funcional agregado
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue[900], // Azul como el AppBar
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
          BottomNavigationBarItem(icon: Icon(Icons.arrow_back), label: "Regresar"),
        ],
        onTap: (index) {
          if (index == 0) Navigator.pushNamed(context, '/');
          else Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Text("IMPRESIONES", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: moradoSuave)),
            const SizedBox(height: 20),
            // Contenedor de Subir Archivos
            Container(
              height: 160, width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20),
                border: Border.all(color: moradoSuave, width: 2),
                boxShadow: [BoxShadow(color: moradoClaro, blurRadius: 10, offset: const Offset(0, 5))],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.upload_file, size: 50, color: moradoClaro),
                  const SizedBox(height: 10),
                  const Text("SUBIR ARCHIVOS", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 25),
            const Align(alignment: Alignment.centerLeft, child: Text("Tipo de Archivo")),
            _dropdown(tipoArchivo, ["PDF", "Word", "Imagen"], (value) => setState(() => tipoArchivo = value)),
            const SizedBox(height: 20),
            const Align(alignment: Alignment.centerLeft, child: Text("Cantidad")),
            Container(
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30), border: Border.all(color: moradoSuave)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(icon: Icon(Icons.remove, color: moradoSuave), onPressed: () { if (cantidad > 1) setState(() => cantidad--); }),
                  Text(cantidad.toString(), style: const TextStyle(fontSize: 18)),
                  IconButton(icon: Icon(Icons.add, color: moradoSuave), onPressed: () => setState(() => cantidad++)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Align(alignment: Alignment.centerLeft, child: Text("Seleccione Método de Pago")),
            _dropdown(metodoPago, ["Efectivo", "Tarjeta"], (value) => setState(() => metodoPago = value)),
            const SizedBox(height: 20),
            const Align(alignment: Alignment.centerLeft, child: Text("Seleccione Método de Entrega")),
            _dropdown(metodoEntrega, ["Recoger en tienda", "Envío a domicilio"], (value) => setState(() => metodoEntrega = value)),
            const SizedBox(height: 30),
            // Botón Continuar
            Container(
              width: double.infinity, height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: LinearGradient(colors: [Colors.blue.shade900, moradoSuave]),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, shadowColor: Colors.transparent),
                onPressed: () => Navigator.pushNamed(context, '/'), // Te lleva al inicio
                child: const Text("CONTINUAR", style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _dropdown(String? value, List<String> items, Function(String?) onChanged) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30), border: Border.all(color: Colors.deepPurple)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value, hint: const Text("Seleccionar"), isExpanded: true,
          items: items.map((item) => DropdownMenuItem(value: item, child: Text(item))).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
// Agrega esto al final de tu archivo para quitar el error
class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue[900]),
            child: const Text("Menú Cometa", style: TextStyle(color: Colors.white, fontSize: 20)),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Inicio"),
            onTap: () => Navigator.pushNamed(context, '/'),
          ),
          ListTile(
            leading: const Icon(Icons.print),
            title: const Text("Impresiones"),
            onTap: () => Navigator.pushNamed(context, '/impresiones'),
          ),
          ListTile(
            leading: const Icon(Icons.shopping_bag),
            title: const Text("Útiles"),
            onTap: () => Navigator.pushNamed(context, '/utiles'),
          ),
        ],
      ),
    );
  }
}