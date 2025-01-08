import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RoutineLedCard extends StatefulWidget {
  RoutineLedCard({
    super.key,
    required this.routineTitle,
    required this.room
    });

  String routineTitle;
  String room;

  @override
  State<RoutineLedCard> createState() => _RoutineLedCardState();
}

class _RoutineLedCardState extends State<RoutineLedCard> {

  final DatabaseReference _db = FirebaseDatabase.instance.ref();

  bool light = false;

  void _getDbInfo() async {
    final snapshot = await _db.child("rotinas/${widget.routineTitle.toLowerCase()}/${widget.room}/lampada/on").get();
    if (snapshot.exists) {
      final data = snapshot.value as bool;
      setState(() {
        light = data;
     });
    }

    _db.child("rotinas/${widget.routineTitle.toLowerCase()}/${widget.room}/lampada/on").onValue.listen((event) {
      final data = event.snapshot.value as bool;
      setState(() {
        light = data;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _getDbInfo();
 }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      width: 160,
      child: Container(
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 241, 241, 241),
          borderRadius: BorderRadius.circular(33)
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.lightbulb_outline,
                  color: Colors.black,
                  size: 30,
                ),
                SizedBox(width: 8),
                Text(
                  "Lâmpada",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),  
                )
              ],
            ),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 40,
                  width: 40,
                  child: Transform.scale(
                    scale: 0.8,
                    child: Switch(
                      value: light,
                      activeColor: Colors.amber,
                      onChanged: (bool value) {
                        setState(() {
                          _db.child("rotinas/${widget.routineTitle.toLowerCase()}/${widget.room}/lampada/on").set(value);
                          light = value;
                        });
                      },
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}