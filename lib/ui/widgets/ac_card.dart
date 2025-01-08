import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../pages/ac_controller.dart';

class AcCard extends StatefulWidget {
  const AcCard({
    super.key,
  });

  @override
  State<AcCard> createState() => _AcCardState();
}

class _AcCardState extends State<AcCard> {

  final DatabaseReference _db = FirebaseDatabase.instance.ref();

  double temperature = 16;
  bool ac = false;
  String mode = '';


  IconData _getIcon(mode) {
    switch(mode) {
      case "COOL MODE":
        return Icons.ac_unit;
      case "DRY MODE":
        return Icons.air;
      case "ECO MODE":
        return Icons.eco;
      case "TURBO MODE":
        return Icons.bolt;
      default:
        return Icons.help; 
    }
  }

  void _getDbInfo() async {
    final snapshot = await _db.child("comodos/quarto/atuadores/ar-condicionado/valor").get();
    if (snapshot.exists) {
      final data = snapshot.value as int;
      setState(() {
        temperature = data.toDouble();
     });
    }

    _db.child("comodos/quarto/atuadores/ar-condicionado/valor").onValue.listen((event) {
      final data = event.snapshot.value as int;
      setState(() {
        temperature = data.toDouble();
      });
    });

    final snapshot2 = await _db.child("comodos/quarto/atuadores/ar-condicionado/modo").get();
    if (snapshot2.exists) {
      final data = snapshot2.value as String;
      setState(() {
        mode = data;
     });
    }

    _db.child("comodos/quarto/atuadores/ar-condicionado/modo").onValue.listen((event) {
      final data = event.snapshot.value as String;
      setState(() {
        mode = data;
      });
    });

    final snapshot3 = await _db.child("comodos/quarto/atuadores/ar-condicionado/on").get();
    if (snapshot3.exists) {
      final data = snapshot3.value as bool;
      setState(() {
        ac = data;
     });
    }
  }

  @override
  void initState() {
    super.initState();
    _getDbInfo();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AcController(isRoutine: false, routine: '')));
      },
      child: Container(
        height: 150,
        width: double.infinity,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 247, 247, 247),
            borderRadius: BorderRadius.circular(33)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "AC - $mode",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 40,
                  width: 40,
                  child: Icon(
                    _getIcon(mode),
                    size: 30,
                  ),
                )
              ],
            ),
            SizedBox(height: 16),
            Container(
              height: 1,
              width: double.infinity,
              color: Colors.black12,
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${temperature.toInt()}°C",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                    height: 40,
                    width: 40,
                    child: Transform.scale(
                      scale: 0.8,
                      child: Switch(
                        value: ac,
                        activeColor: Colors.amber,
                        onChanged: (bool value) {
                          setState(() {
                            _db.child("comodos/quarto/atuadores/ar-condicionado/on").set(value);
                            ac = value;
                          });
                        },
                      ),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
