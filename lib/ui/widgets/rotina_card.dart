import 'package:flutter/material.dart';
import 'package:home_sense/ui/pages/rotinas_page.dart';

import '../pages/rooms/quarto_screen.dart';
import '../pages/rooms/sala_screen.dart';
import '../pages/rotinas/chegada_screen.dart';
import '../pages/rotinas/saida_screen.dart';

class RotinaCard extends StatelessWidget {
  const RotinaCard({
    super.key,
    required this.rotinas,
    required this.index,
  });

  final List rotinas;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateToRoom(rotinas[index], context);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        height: MediaQuery.of(context).size.height * 0.2, // Altura do card
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: AssetImage(
                'assets/images/sala_img.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [
                Colors.black.withOpacity(0.6),
                Colors.transparent,
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  rotinas[index],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void navigateToRoom(String room, BuildContext context) {
  switch (room) {
    case "Chegada":
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ChegadaScreen()),
      );
      break;
    case "Saida":
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SaidaScreen()),
      );
      break;
    default:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RotinasPage()),
      );
      break;
  }
}
