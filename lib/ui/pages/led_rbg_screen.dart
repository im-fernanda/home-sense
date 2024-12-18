import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class LedRGBScreen extends StatefulWidget {
  const LedRGBScreen({super.key, required this.thisScreen});

  final String thisScreen;

  @override
  State<LedRGBScreen> createState() => _LedRGBScreenState();
}

class _LedRGBScreenState extends State<LedRGBScreen> {
  final DatabaseReference _db = FirebaseDatabase.instance.ref();

  Color selectedColor = Colors.white;

  // Lista de cores com apenas vermelho, verde, azul e branco
  final List<Map<String, dynamic>> colors = [
    {'name': 'Vermelho', 'color': Colors.red},
    {'name': 'Verde', 'color': Colors.green},
    {'name': 'Azul', 'color': Colors.blue},
    {'name': 'Branco', 'color': Colors.white},
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white, // Cor de fundo mais clara para combinar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
        centerTitle: true,
        title: Column(
          children: [
            Text(
              'Controle de LED RGB',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            SizedBox(height: 5),
            Text(
              widget.thisScreen.toUpperCase(), // Nome do cômodo em maiúsculo
              style: TextStyle(
                color: Colors
                    .blueAccent, // Cor de destaque, pode ser personalizada
                fontSize: 15,
              ),
            ),
          ],
        ),
        toolbarHeight: height / 6, // Ajuste para o tamanho do título
      ),
      body: Column(
        children: [
          // Preview da cor atual
          Container(
            height: 150,
            width: double.infinity,
            color: selectedColor,
            child: const Center(
              child: Text(
                'Cor Atual',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
          ),
          const SizedBox(height: 10),

          // Grade com círculos para seleção de cor
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: colors.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    _db
                        .child(
                            "comodos/${widget.thisScreen}/atuadores/lampada-rgb/cor")
                        .set(colors[index]['name']);
                    setState(() {
                      selectedColor = colors[index]['color'];
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle, // Garante que a borda seja circular
                      border: Border.all(
                        color: Colors.black, // Cor da borda
                        width: 1.0, // Largura da borda
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: colors[index]['color'],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
