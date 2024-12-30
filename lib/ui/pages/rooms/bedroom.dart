import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:home_sense/ui/pages/ac_controller.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../widgets/ac_card.dart';
import '../../widgets/led_rgb_card.dart';
import '../../widgets/sensors_card.dart';

class Bedroom extends StatefulWidget {
  Bedroom({
    super.key,
  });

  @override
  State<Bedroom> createState() => _BedroomState();
}

class _BedroomState extends State<Bedroom> {
  Color color = Colors.amber;
  bool light = false;
  bool ac = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Stack(
        children: [
          Column(
            children: [
              Image.asset(
                'assets/images/quarto_img.jpg',
                fit: BoxFit.cover,
                width: double.infinity,
                height: height / 2,
              ),
              Container(
                height: height / 2,
                width: double.infinity,
                decoration:
                    const BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: Colors.white,
                      blurRadius: 20,
                      spreadRadius: 20,
                      offset: Offset(5, 0))
                ]),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 100,
                        spreadRadius: 200,
                        offset: Offset(5, 0))
                  ]),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.arrow_back_ios_new_outlined,
                            size: 30, color: Colors.white),
                      ),
                      const Expanded(
                          child: Center(
                        child: Text(
                          "Quarto",
                          style: TextStyle(fontSize: 22, color: Colors.white),
                        ),
                      ))
                    ],
                  ),
                ),
                SizedBox(height: height / 2 - 120),
                Row(
                  children: [
                    SensorsCard(comodo: "quarto"),
                    SizedBox(width: 16),
                    LedRgbCard(comodo: "quarto",),
                  ],
                ),
                SizedBox(height: 16),
                AcCard(),
              ],
            ),
          )
        ],
      ),
    )));
  }
}
