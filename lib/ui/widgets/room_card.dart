import 'package:flutter/material.dart';

import '../pages/rooms/banheiro_screen.dart';
import '../pages/rooms/cozinha_screen.dart';
import '../pages/rooms/externo_screen.dart';
import '../pages/rooms/garagem_screen.dart';
import '../pages/home_page.dart';
import '../pages/rooms/quarto_screen.dart';
import '../pages/rooms/sala_screen.dart';

class RoomCard extends StatelessWidget {
  const RoomCard({
    super.key,
    required this.rooms,
    required this.index,
  });

  final List rooms;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateToRoom(rooms[index], context);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        height: 180, // Altura do card
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: AssetImage(
                'assets/images/${rooms[index].toLowerCase()}_img.jpg'), // Adapte os nomes das imagens ao padrão
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
                  rooms[index],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Dispositivos conectados: 4', // Informação adicional
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
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
    case "Sala":
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SalaScreen()),
      );
      break;
    case "Quarto":
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => QuartoScreen()),
      );
      break;
    case "Cozinha":
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CozinhaScreen()),
      );
      break;
    case "Banheiro":
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BanheiroScreen()),
      );
      break;
    case "Garagem":
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => GaragemScreen()),
      );
      break;

    case "Externo":
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ExternoScreen()),
      );
      break;
    default:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
      break;
  }
}
