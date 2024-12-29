import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Garage extends StatefulWidget {
  Garage({
    super.key,
  });

  @override
  State<Garage> createState() => _GarageState();
}

class _GarageState extends State<Garage> {

  bool isSwicthToOpenGateEnabled = true;
  bool isSwicthToCloseGateEnabled = false;
  bool gateIsOpen = false;
  bool light = false;

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
                    'assets/images/garagem_img.jpg',
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
                          offset: Offset(5, 0),
                        )
                      ],
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
                            offset: Offset(5, 0),
                          )
                        ],
                      ),
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
                                "Garage",
                                style: TextStyle(fontSize: 22, color: Colors.white),
                              ),
                            ),
                          ),
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
                              borderRadius: BorderRadius.circular(33),
                            ),
                            child: Column(
                              children: [
                                Text("Gate Control"),
                                SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Open",
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
                                          value: gateIsOpen,
                                          activeColor: Colors.amber,
                                          onChanged: isSwicthToOpenGateEnabled
                                            ? (bool value) {
                                            setState(() {
                                              gateIsOpen = value;
                                              isSwicthToOpenGateEnabled = false;
                                              isSwicthToCloseGateEnabled = true;
                                            }); 
                                          } : (_) {},
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
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Close",
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
                                          value: !gateIsOpen,
                                          activeColor: Colors.amber,
                                          onChanged: isSwicthToCloseGateEnabled 
                                            ? (bool value) {
                                            setState(() {
                                              gateIsOpen = !value;
                                              isSwicthToCloseGateEnabled = false;
                                              isSwicthToOpenGateEnabled = true;
                                            });
                                          } : (_) {},
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Container(
                            height: 180,
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 247, 247, 247),
                              borderRadius: BorderRadius.circular(33),
                            ),
                            child: Column(
                              children: [
                                Text("Brightness"),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "32%",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 26,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      height: 40,
                                      width: 40,
                                      child: Icon(
                                        Icons.lightbulb_outline,
                                        size: 30,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 24),
                                Container(
                                  height: 1,
                                  width: double.infinity,
                                  color: Colors.black12,
                                ),
                                SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Lights",
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
                                          value: light,
                                          activeColor: Colors.amber,
                                          onChanged: (bool value) {
                                            setState(() {
                                              light = value;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}