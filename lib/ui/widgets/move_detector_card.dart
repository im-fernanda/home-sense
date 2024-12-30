import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MoveDetectorCard extends StatefulWidget {
  const MoveDetectorCard({
    super.key,
  });

  @override
  State<MoveDetectorCard> createState() => _MoveDetectorCardState();
}

class _MoveDetectorCardState extends State<MoveDetectorCard> {

  final DatabaseReference _db = FirebaseDatabase.instance.ref();

  bool move = false;
  String state = "Nenhum movimento detectado";

  void _getDbInfo() {
    _db.child("comodos/sala/sensores/movimento").onValue.listen((event) {
      final data = event.snapshot.value as bool;
      setState(() {
        move = data;
        if(move) {
          state = "Algum movimento foi detectado";
        }else {
          state = "Nenhum movimento detectado";
        }
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
    return Container(
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
                "DETECTOR DE MOVIMENTO",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 40,
                width: 40,
                child: Icon(
                  move ? MdiIcons.motionSensor :
                  MdiIcons.motionSensorOff,
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
                state,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ],
          )
        ],
      ),
    );
  }
}