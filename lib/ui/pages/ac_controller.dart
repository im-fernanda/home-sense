import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/database_service.dart';

class AcController extends StatefulWidget {
  AcController({
    super.key,
    required this.isRoutine,
    required this.routine
    });

  bool isRoutine;
  String routine;

  @override
  State<AcController> createState() => _AcControllerState();
}

class _AcControllerState extends State<AcController> {

  final DatabaseReference _db = FirebaseDatabase.instance.ref();

  Color color = Colors.lightBlueAccent;
  double temperature = 16;
  bool isSwitchedOn = false;
  bool autoAdjustment = false;
  int selectedMode = 0;
  String mode = '';

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

    final snapshot3 = await _db.child("comodos/quarto/atuadores/ar-condicionado/index").get();
    if (snapshot3.exists) {
      final data = snapshot3.value as int;
      setState(() {
        selectedMode = data;
     });
    }

    _db.child("comodos/quarto/atuadores/ar-condicionado/index").onValue.listen((event) {
      final data = event.snapshot.value as int;
      setState(() {
        selectedMode = data;
      });
    });
  }

  void _getRoutineDbInfo() async {
    final snapshot = await _db.child("rotinas/${widget.routine.toLowerCase()}/quarto/ar-condicionado/valor").get();
    if (snapshot.exists) {
      final data = snapshot.value as int;
      setState(() {
        temperature = data.toDouble();
     });
    }

    _db.child("rotinas/${widget.routine.toLowerCase()}/quarto/ar-condicionado/valor").onValue.listen((event) {
      final data = event.snapshot.value as int;
      setState(() {
        temperature = data.toDouble();
      });
    });

    final snapshot2 = await _db.child("rotinas/${widget.routine.toLowerCase()}/quarto/ar-condicionado/modo").get();
    if (snapshot2.exists) {
      final data = snapshot2.value as String;
      setState(() {
        mode = data;
     });
    }

    _db.child("rotinas/${widget.routine.toLowerCase()}/quarto/ar-condicionado/modo").onValue.listen((event) {
      final data = event.snapshot.value as String;
      setState(() {
        mode = data;
      });
    });

    final snapshot3 = await _db.child("rotinas/${widget.routine.toLowerCase()}/quarto/ar-condicionado/index").get();
    if (snapshot3.exists) {
      final data = snapshot3.value as int;
      setState(() {
        selectedMode = data;
     });
    }

    _db.child("rotinas/${widget.routine.toLowerCase()}/quarto/ar-condicionado/index").onValue.listen((event) {
      final data = event.snapshot.value as int;
      setState(() {
        selectedMode = data;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    if(widget.isRoutine) {
      _getRoutineDbInfo();
    } else {
      _getDbInfo();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Bedroom",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            // Temperature Dial
            Center(
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 200,
                        height: 200,
                        child: CircularProgressIndicator(
                          value: (temperature - 10) / 20,
                          strokeWidth: 12,
                          color: color,
                          backgroundColor: Colors.grey[300],
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            mode,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            '${temperature.toInt()}°',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: color,
                            ),
                          ),
                          Icon(
                            _getModeIcon(selectedMode),
                            color: color,
                            size: 30,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 48),
                  Slider(
                    value: temperature,
                    min: 16,
                    max: 30,
                    divisions: 20,
                    activeColor: color,
                    inactiveColor: Colors.grey[300],
                    label: '${temperature.toInt()}°',
                    onChanged: (value) {
                      setState(() {
                        temperature = value;
                        if(widget.isRoutine) {
                          _db.child("rotinas/${widget.routine.toLowerCase()}/quarto/ar-condicionado/valor").set(temperature.toInt());
                        } else {
                          _db.child("comodos/quarto/atuadores/ar-condicionado/valor").set(temperature.toInt());
                          _db.child("rotinas/chegada/on").set(false);
                          _db.child("rotinas/saida/on").set(false);
                        }
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 48),
            // Conditioner Mode
            const Text(
              'Conditioner Mode',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(4, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedMode = index;
                       if(widget.isRoutine) {
                          _db.child("rotinas/${widget.routine.toLowerCase()}/quarto/ar-condicionado/modo").set(_getModeName(selectedMode));
                          _db.child("rotinas/${widget.routine.toLowerCase()}/quarto/ar-condicionado/index").set(selectedMode);
                        } else {
                          _db.child("comodos/quarto/atuadores/ar-condicionado/modo").set(_getModeName(selectedMode));
                          _db.child("comodos/quarto/atuadores/ar-condicionado/index").set(selectedMode);
                          _db.child("rotinas/chegada/on").set(false);
                          _db.child("rotinas/saida/on").set(false);
                        }
                    });
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: selectedMode == index
                          ? color
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      _getModeIcon(index),
                      color: selectedMode == index
                          ? Colors.white
                          : Colors.grey[600],
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 20),
            // Auto Adjustment
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Auto Adjustment',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'It will save energy and money',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Switch(
                  value: autoAdjustment,
                  activeColor: color,
                  onChanged: (value) {
                    setState(() {
                      autoAdjustment = value;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  IconData _getModeIcon(int index) {
    switch (index) {
      case 0:
        return Icons.ac_unit;
      case 1:
        return Icons.air;
      case 2:
        return Icons.eco;
      case 3:
        return Icons.bolt;
      default:
        return Icons.help;
    }
  }

  String _getModeName(int index) {
    switch (index) {
      case 0:
        return "COOL MODE";
      case 1:
        return "DRY MODE";
      case 2:
        return "ECO MODE";
      case 3:
        return "TURBO MODE";
      default:
        return "ERROR";
    }
  }
}
