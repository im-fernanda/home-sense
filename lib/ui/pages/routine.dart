import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:home_sense/ui/pages/ac_controller.dart';

import '../widgets/routine_led_card.dart';
import '../widgets/routine_led_rgb_card.dart';

class Routine extends StatefulWidget {
  const Routine({super.key, required this.routine});

  final String routine;

  @override
  State<Routine> createState() => _RoutineState();
}

class _RoutineState extends State<Routine> {

  final DatabaseReference _db = FirebaseDatabase.instance.ref();

  bool light = false;
  bool ac = false;
  double temperature = 16;
  int selectedMode = 0;
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

    final snapshot4 = await _db.child("rotinas/${widget.routine.toLowerCase()}/quarto/ar-condicionado/on").get();
    if (snapshot4.exists) {
      final data = snapshot4.value as bool;
      setState(() {
        ac = data;
     });
    }

    _db.child("rotinas/${widget.routine.toLowerCase()}/quarto/ar-condicionado/on").onValue.listen((event) {
      final data = event.snapshot.value as bool;
      setState(() {
        ac = data;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _getRoutineDbInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back_ios_new_outlined,
                        size: 30, color: Colors.black
                      ),
                    ),
                    SizedBox(width: 16),
                    Text(
                      "${widget.routine}",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Text(
                  "Sala",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w600
                  ),
                ),
                SizedBox(height: 16),
                RoutineLedCard(routineTitle: widget.routine, room: "sala"),
                SizedBox(height: 16),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: Colors.black12,
                ),
                SizedBox(height: 16),
                Text(
                  "Quarto",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w600
                  ),
                ),
                SizedBox(height: 16),
                RoutineLedRgbCard(routineTitle: widget.routine),
                SizedBox(height: 16),
                GestureDetector(
                  onLongPress: () {
                    Navigator.push(
                      context, MaterialPageRoute(builder: (context) => AcController(isRoutine: true, routine: widget.routine,)));
                  },
                  child: SizedBox(
                    height: 170,
                    width: double.infinity,
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
                              Text(
                                "AC - $mode",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                                ),  
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
                                          ac = value;
                                          _db.child("rotinas/${widget.routine.toLowerCase()}/quarto/ar-condicionado/on").set(value);
                                        });
                                      },
                                    ),
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: Colors.black12,
                ),
                SizedBox(height: 16),
                Text(
                  "Cozinha",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w600
                  ),
                ),
                SizedBox(height: 16),
                RoutineLedCard(routineTitle: widget.routine, room: "cozinha"),
                SizedBox(height: 16),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: Colors.black12,
                ),
                SizedBox(height: 16),
                Text(
                  "Banheiro",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w600
                  ),
                ),
                SizedBox(height: 16),
                RoutineLedCard(routineTitle: widget.routine, room: "banheiro"),
                SizedBox(height: 16),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: Colors.black12,
                ),
                SizedBox(height: 16),
                Text(
                  "Garagem",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w600
                  ),
                ),
                SizedBox(height: 16),
                RoutineLedCard(routineTitle: widget.routine, room: "garagem"),
                SizedBox(height: 16),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: Colors.black12,
                ),
                SizedBox(height: 16),
                Text(
                  "Área Externa",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w600
                  ),
                ),
                SizedBox(height: 16),
                RoutineLedCard(routineTitle: widget.routine, room: "externo"),
              ],
            ),
          ),
        )
      )
    );
  }
}
