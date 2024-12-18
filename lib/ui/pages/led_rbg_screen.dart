import 'package:flutter/material.dart';

class LedRGBScreen extends StatefulWidget {
  const LedRGBScreen({super.key});

  @override
  State<LedRGBScreen> createState() => _LedRGBScreenState();
}

class _LedRGBScreenState extends State<LedRGBScreen> {
  Color selectedColor = Colors.white;

  final List<Map<String, dynamic>> colors = [
    {'name': 'Vermelho', 'color': Colors.red},
    {'name': 'Verde', 'color': Colors.green},
    {'name': 'Azul', 'color': Colors.blue},
    {'name': 'Laranja', 'color': Colors.orange},
    {'name': 'Verde Claro', 'color': Colors.lightGreen},
    {'name': 'Azul Claro', 'color': Colors.lightBlue},
    {'name': 'Amarelo', 'color': Colors.yellow},
    {'name': 'Ciano', 'color': Colors.cyan},
    {'name': 'Magenta', 'color': Colors.purpleAccent},
    {'name': 'Rosa', 'color': Colors.pink},
    {'name': 'Violeta', 'color': Colors.deepPurple},
    {'name': 'Vermelho Claro', 'color': Colors.redAccent},
    {'name': 'Verde Azulado', 'color': Colors.teal},
    {'name': 'Azul Profundo', 'color': Colors.indigo},
    {'name': 'Roxo', 'color': Colors.purple},
    {'name': 'Branco', 'color': Colors.white},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Controle de LEDs RGB'),
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

          // Grade com botões de cores
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
                return ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedColor = colors[index]['color'];
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colors[index]['color'],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    colors[index]['name'],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: colors[index]['color'] == Colors.white
                          ? Colors.black
                          : Colors.white,
                      fontSize: 10,
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
