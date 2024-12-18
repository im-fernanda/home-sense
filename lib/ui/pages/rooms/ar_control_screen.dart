import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utils/Constants.dart';
import '../../utils/mode_button.dart';

class ArControlScreen extends StatefulWidget {
  const ArControlScreen({super.key});

  @override
  State<ArControlScreen> createState() => _ArControlScreenState();
}

class _ArControlScreenState extends State<ArControlScreen> {
  double temperature = 25;
  double minTemperature = 16;
  double maxTemperature = 30;

  List<String> modeTitles = [
    'Auto',
    'Cool',
    'Dry',
  ];

  List<IconData> modeIcons = [
    Icons.water_drop,
    Icons.ac_unit,
    Icons.mode_fan_off,
  ];

  List<String> fanSpeedModes = [
    'Low',
    'Mid',
    'High',
  ];

  List<IconData> fanSpeedIcons = [
    Icons.air,
    Icons.storm,
    Icons.tornado,
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Constants.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
        centerTitle: true,
        title: Column(
          children: [
            Text(
              'Ar Condicionado',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Quarto',
              style: TextStyle(
                color: Constants.pinkColor,
                fontSize: 15,
              ),
            ),
          ],
        ),
        toolbarHeight: height / 6,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 30),
                    Column(
                      children: [
                        Text(
                          temperature.toStringAsFixed(0),
                          style: TextStyle(
                            fontSize: 70,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'Celsius',
                          style: TextStyle(
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '°',
                      style: TextStyle(
                        fontSize: 70,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                    children: [
                      Slider(
                        min: minTemperature,
                        max: maxTemperature,
                        value: temperature,
                        onChanged: (value) {
                          setState(() {
                            temperature = value;
                          });
                        },
                        activeColor: Colors.grey,
                        inactiveColor: Colors.transparent,
                        thumbColor: Constants.pinkColor,
                        divisions: 30,
                      ),
                      Container(
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                if (temperature > minTemperature &&
                                    temperature < maxTemperature) {
                                  setState(() {
                                    --temperature;
                                  });
                                }
                              },
                              icon: Icon(
                                Icons.arrow_left,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                if (temperature > minTemperature &&
                                    temperature < maxTemperature) {
                                  setState(() {
                                    ++temperature;
                                  });
                                }
                              },
                              icon: Icon(
                                Icons.arrow_right,
                              ),
                            ),
                          ],
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Constants.shadowColor,
                              Constants.backgroundColor,
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(5, 5),
                              blurRadius: 15,
                              spreadRadius: -5,
                            ),
                            BoxShadow(
                              color: Constants.backgroundColor,
                              offset: Offset(-5, -5),
                              blurRadius: 10,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Text(
                          'Modo',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: ListView.separated(
                      itemCount: modeTitles.length,
                      itemBuilder: (context, index) => ModeButton(
                        title: modeTitles[index],
                        icon: modeIcons[index],
                      ),
                      separatorBuilder: (context, index) => SizedBox(width: 10),
                      scrollDirection: Axis.horizontal,
                      physics: NeverScrollableScrollPhysics(),
                    ),
                  ),
                  SizedBox(height: height / 25),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Text(
                          'Velocidade do Ventilador',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: ListView.separated(
                      itemCount: fanSpeedModes.length,
                      itemBuilder: (context, index) => ModeButton(
                        title: fanSpeedModes[index],
                        icon: fanSpeedIcons[index],
                      ),
                      separatorBuilder: (context, index) => SizedBox(width: 10),
                      scrollDirection: Axis.horizontal,
                      physics: NeverScrollableScrollPhysics(),
                    ),
                  ),
                  SizedBox(height: height / 25),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
