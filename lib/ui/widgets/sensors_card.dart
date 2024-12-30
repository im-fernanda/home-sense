import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SensorsCard extends StatefulWidget {
  SensorsCard({
    super.key,
    required this.comodo
  });

  String comodo;

  @override
  State<SensorsCard> createState() => _SensorsCardState();
}

class _SensorsCardState extends State<SensorsCard> {

  final DatabaseReference _db = FirebaseDatabase.instance.ref();

  int temperature = 0;
  int humidity = 0;

  void _getDbInfo() {
    if(widget.comodo != "sala") {
      _db.child("comodos/${widget.comodo}/sensores/temperatura").onValue.listen((event) {
      final data = event.snapshot.value as int;
      setState(() {
        temperature = data;
        });
      });

      _db.child("comodos/${widget.comodo}/sensores/umidade").onValue.listen((event) {
        final data = event.snapshot.value as int;
        setState(() {
          humidity = data;
        });
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
    return Expanded(
      child: Container(
        height: 180,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 247, 247, 247),
            borderRadius: BorderRadius.circular(33)),
        child: Column(
          children: [
            Text("Temperatura"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "$temperature °C",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 26,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 40,
                  width: 40,
                  child: Icon(
                    MdiIcons.homeThermometerOutline,
                    size: 30,
                  ),
                )
              ],
            ),
            SizedBox(height: 12),
            Container(
              height: 1,
              width: double.infinity,
              color: Colors.black12,
            ),
            SizedBox(height: 12),
            Text("Umidade"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "$humidity%",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 26,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 40,
                  width: 40,
                  child: Icon(
                    Icons.water_drop_outlined,
                    size: 30,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}