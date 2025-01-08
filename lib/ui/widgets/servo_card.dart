import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/database_service.dart';

class ServoCard extends StatefulWidget {
  const ServoCard({
    super.key,
  });


  @override
  State<ServoCard> createState() => _ServoCardState();
}

class _ServoCardState extends State<ServoCard> {

  final DatabaseReference _db = FirebaseDatabase.instance.ref();

  bool openGate = false;
  bool closeGate = false;
  bool isSwitchToOpenEnabled = false;
  bool isSwitchToCloseEnabled = false;

  void _getDbInfo() {
    _db.child("comodos/garagem/atuadores/servo/abrir").onValue.listen((event) {
      final data = event.snapshot.value as bool;
      if(data) {
        setState(() {
          openGate = data;
          closeGate = !data;
          isSwitchToOpenEnabled = false;
          isSwitchToCloseEnabled = true;
        });
      }
    });

    _db.child("comodos/garagem/atuadores/servo/fechar").onValue.listen((event) {
      final data = event.snapshot.value as bool;
      if(data) {
        setState(() {
          openGate = !data;
          closeGate = data;
          isSwitchToOpenEnabled = true;
          isSwitchToCloseEnabled = false;
        });
      }
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
            Text("Portão"),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Abrir",
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
                      value: openGate,
                      activeColor: Colors.amber,
                      onChanged: isSwitchToOpenEnabled ? (bool value) {
                        setState(() {
                          openGate = value;
                          isSwitchToOpenEnabled = false;
                          isSwitchToCloseEnabled = true;
                        });
                        _db.child("comodos/garagem/atuadores/servo/abrir").set(value);
                        _db.child("comodos/garagem/atuadores/servo/fechar").set(!value);
                        _db.child("rotinas/chegada/on").set(false);
                        _db.child("rotinas/saida/on").set(false);
                      } : (_) {}
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Container(
              height: 1,
              width: double.infinity,
              color: Colors.black12,
            ),
            SizedBox(height: 22),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Fechar",
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
                      value: closeGate,
                      activeColor: Colors.amber,
                      onChanged: isSwitchToCloseEnabled ? (bool value) {
                        setState(() {
                          closeGate = value;
                          isSwitchToOpenEnabled = true;
                          isSwitchToCloseEnabled = false;
                        });
                        _db.child("comodos/garagem/atuadores/servo/fechar").set(value);
                        _db.child("comodos/garagem/atuadores/servo/abrir").set(!value);
                        _db.child("rotinas/chegada/on").set(false);
                        _db.child("rotinas/saida/on").set(false);
                      } : (_) {}
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