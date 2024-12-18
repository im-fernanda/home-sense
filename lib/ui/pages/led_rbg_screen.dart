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
  final List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.white,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Controle de LED RGB'),
        centerTitle: true,
        backgroundColor: Colors.black87,
        foregroundColor: Colors.white,
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
                        .set(colors[index].toString());
                    setState(() {
                      selectedColor = colors[index];
                    });
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: colors[index],
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
