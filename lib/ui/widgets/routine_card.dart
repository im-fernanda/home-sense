import 'package:flutter/material.dart';

class RoutineCard extends StatelessWidget {
  const RoutineCard({
    super.key,
    required this.routineTitle,
  });

  final String routineTitle;

  IconData _getIcon(String routineTitle) {
    switch (routineTitle) {
      case "Coming":
        return Icons.meeting_room_outlined;
      case "Living":
        return Icons.door_back_door_outlined;
      default:
        return Icons.error_outline;
    }
  }

  String? _getImage(String routineTitle) {
    switch (routineTitle) {
      case "Coming":
        return "chegada_img.jpg";
      case "Living":
        return "saida_img.jpg";
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: Image.asset(
                'assets/images/${_getImage(routineTitle)}',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            routineTitle,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
