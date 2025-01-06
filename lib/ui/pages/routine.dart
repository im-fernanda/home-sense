import 'package:flutter/material.dart';
import 'package:home_sense/ui/pages/ac_controller.dart';

import '../widgets/routine_led_rgb_card.dart';

class Routine extends StatefulWidget {
  const Routine({super.key, required this.rotina});

  final String rotina;

  @override
  State<Routine> createState() => _RoutineState();
}

class _RoutineState extends State<Routine> {

  bool light = false;
  bool ac = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Quarto",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w600
                  ),
                ),
                SizedBox(height: 16),
                RoutineLedRgbCard(routineTitle: widget.rotina,),
                SizedBox(height: 16),
                GestureDetector(
                  onLongPress: () {
                    Navigator.push(
                      context, MaterialPageRoute(builder: (context) => AcController()));
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
                                "AC - TURBO MODE",
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
                                  Icons.ac_unit,
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
                                "18°C",
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
              ],
            ),
          ),
        )
      )
    );
  }
}
