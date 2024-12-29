import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:home_sense/ui/pages/ac_controller.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../widgets/ac_card.dart';
import '../../widgets/led_rgb_card.dart';

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
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white,
                          blurRadius: 20,
                          spreadRadius: 20,
                          offset: Offset(5, 0)
                        )
                      ]
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            blurRadius: 100,
                            spreadRadius: 200,
                            offset: Offset(5, 0)
                          )
                        ]
                      ),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.arrow_back_ios_new_outlined, 
                              size: 30, 
                              color: Colors.white
                            ),
                          ),
                          const Expanded(
                            child: Center(
                              child: Text(
                                "Bedroom",
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white
                                ),  
                              ),
                            )
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: height / 2 - 120),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 180,
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 247, 247, 247),
                              borderRadius: BorderRadius.circular(33)
                            ),
                            child: Column(
                              children: [
                                Text("Temperature"),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "26° C",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 26,
                                        fontWeight: FontWeight.w600
                                      ),  
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
                                Text("Humidity"),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "47%",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 26,
                                        fontWeight: FontWeight.w600
                                      ),  
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
                        ),
                        SizedBox(width: 16),
                        LedRgbCard(),
                      ],
                    ),
                    SizedBox(height: 16),
                    AcCard(),
                  ],
                ),
              )
            ],
          ),
        ) 
      )
    );
  }
}

