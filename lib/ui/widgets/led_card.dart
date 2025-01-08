import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/database_service.dart';

class LedCard extends StatefulWidget {
  LedCard({
    super.key,
    required this.comodo
  });

  String comodo;

  @override
  State<LedCard> createState() => _LedCardState();
}

class _LedCardState extends State<LedCard> {

  final DatabaseReference _db = FirebaseDatabase.instance.ref();

  bool light = false;
  int brightness = 0;

  void _getDbInfo() {
    _db.child("comodos/${widget.comodo}/atuadores/lampada/on").onValue.listen((event) {
      final data = event.snapshot.value as bool;
      setState(() {
        light = data;
      });
    });

    _db.child("comodos/${widget.comodo}/sensores/luminosidade").onValue.listen((event) {
      final data = event.snapshot.value as int;
      setState(() {
        brightness = data;
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
    return Expanded(
      child: Container(
        height: 180,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 247, 247, 247),
          borderRadius: BorderRadius.circular(33),
        ),
        child: Column(
          children: [
            Text("Luminosidade"),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "$brightness%",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 26,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 40,
                  width: 40,
                  child: Icon(
                    Icons.lightbulb_outline,
                    size: 30,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Container(
              height: 1,
              width: double.infinity,
              color: Colors.black12,
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Lâmpada",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
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
                          _db.child("comodos/${widget.comodo}/atuadores/lampada/on").set(value);
                          _db.child("rotinas/chegada/on").set(false);
                          _db.child("rotinas/saida/on").set(false);
                          light = value;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}