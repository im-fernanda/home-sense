import 'package:flutter/material.dart';
import 'package:home_sense/ui/pages/rooms/living_room.dart';

import '../pages/rooms/bathroom.dart';
import '../pages/rooms/bedroom.dart';
import '../pages/rooms/garage.dart';
import '../pages/rooms/kitchen.dart';
import '../pages/rooms/outside_area.dart';

class RoomCard extends StatelessWidget {
  RoomCard({
    super.key,
    required this.roomImage,
    required this.roomTitle
  });

  String roomImage;
  String roomTitle;

  void _navigateToRoom(roomTitle, context) {
    switch(roomTitle) {
      case "Living Room":
        Navigator.push(context, MaterialPageRoute(builder: (context) => LivingRoom()));
        return;
      case "Bedroom":
        Navigator.push(context, MaterialPageRoute(builder: (context) => Bedroom()));
        return;
      case "Kitchen":
        Navigator.push(context, MaterialPageRoute(builder: (context) => Kitchen()));
        return;
      case "Bathroom":
        Navigator.push(context, MaterialPageRoute(builder: (context) => Bathroom()));
        return;
      case "Garage":
        Navigator.push(context, MaterialPageRoute(builder: (context) => Garage()));
        return;
      case "Outside Area":
        Navigator.push(context, MaterialPageRoute(builder: (context) => OutsideArea()));
        return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          GestureDetector(
            onTap: () => _navigateToRoom(roomTitle, context),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: Image.asset(
                'assets/images/$roomImage',
                fit: BoxFit.cover,
                height: 200,
                width: 200,
                ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(
              roomTitle,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600
              ),
            ),
          )
        ],
      ),
    );
  }
}