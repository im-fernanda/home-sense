import 'package:flutter/material.dart';

import '../pages/rooms/banheiro_screen.dart';
import '../pages/rooms/cozinha_screen.dart';
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
    return SizedBox(
      height: 100,
      child: GestureDetector(
        child: Card(
          margin: const EdgeInsets.only(bottom: 16.0),
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: Theme.of(context).colorScheme.secondaryContainer,
          child: Center(
            child: ListTile(
              title: Text(
                rooms[index],
              ),
              leading: Icon(getRoomIcon(rooms[index]), size: 32),
            ),
          ),
        ),
        onTap: () {
          navigateToRoom(rooms[index], context);
        },
      ),
    );
  }
}

IconData getRoomIcon(String room) {
  switch (room) {
    case "Sala":
      return Icons.chair_outlined;
    case "Quarto":
      return Icons.king_bed_outlined;
    case "Cozinha":
      return Icons.kitchen_outlined;
    case "Banheiro":
      return Icons.bathtub_outlined;
    case "Garagem":
      return Icons.garage_outlined;
    default:
      return Icons.error_outline;
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
    default:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
      break;
  }
}
