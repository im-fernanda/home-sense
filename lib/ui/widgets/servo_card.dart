import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ServoCard extends StatefulWidget {
  const ServoCard({
    super.key,
  });


  @override
  State<ServoCard> createState() => _ServoCardState();
}

class _ServoCardState extends State<ServoCard> {

  final DatabaseReference _db = FirebaseDatabase.instance.ref();

  bool isGateOpen = false;
  bool isSwicthToOpenGateEnabled = true;
  bool isSwicthToCloseGateEnabled = false;
  String lastFunction = "Fechou";

  void _getDbInfo() {
    _db.child("comodos/garagem/atuadores/servo/on").onValue.listen((event) {
      final data = event.snapshot.value as bool;
      setState(() {
        isGateOpen = data;
      });
    });
  }

  @override
  void initState() {
    super.initState();
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
                      value: isGateOpen,
                      activeColor: Colors.amber,
                      onChanged: isSwicthToOpenGateEnabled
                          ? (bool value) {
                            isGateOpen = value;
                            _db.child("comodos/garagem/atuadores/servo/on").set(value);
                            isSwicthToOpenGateEnabled = false;
                            isSwicthToCloseGateEnabled = true;
                            _db.child("comodos/garagem/atuadores/servo/ultimaFuncao").set("Abriu");
                            }
                          : (_) {},
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
                      value: isGateOpen,
                      activeColor: Colors.amber,
                      onChanged: isSwicthToCloseGateEnabled
                          ? (bool value) {
                            isGateOpen = !value;
                            _db.child("comodos/garagem/atuadores/servo/on").set(!value);
                            isSwicthToOpenGateEnabled = true;
                            isSwicthToCloseGateEnabled = false;
                            _db.child("comodos/garagem/atuadores/servo/ultimaFuncao").set("Fechou");
                            }
                          : (_) {},
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