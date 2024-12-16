import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/utils/constants.dart';
import '/widgets/mode_button.dart';

class ArControlScreen extends StatefulWidget {
  final bool initialPowerState; // Estado inicial do switch

  const ArControlScreen({super.key, required this.initialPowerState});

  @override
  State<ArControlScreen> createState() => _ArControlScreenState();
}

class _ArControlScreenState extends State<ArControlScreen> {
  late bool powerOn;

  @override
  void initState() {
    super.initState();
    powerOn = widget.initialPowerState; // Inicializa com o valor recebido
  }

  double temperature = 25;
  double minTemperature = 10;
  double maxTemperature = 40;

  List<String> modeTitles = [
    'Auto',
    'Cool',
    'Dry',
  ];

  List<IconData> modeIcon = [
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
                      itemBuilder: (context, index) => Modebutton(
                        title: modeTitles[index],
                        icon: modeIcon[index],
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
                          'Velocidade',
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
                      itemBuilder: (context, index) => Modebutton(
                        title: fanSpeedModes[index],
                        icon: fanSpeedIcons[index],
                      ),
                      separatorBuilder: (context, index) => SizedBox(width: 10),
                      scrollDirection: Axis.horizontal,
                      physics: NeverScrollableScrollPhysics(),
                    ),
                  ),
                  SizedBox(height: height / 25),
                  Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.power_settings_new,
                          color: Constants.greyColor,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Power',
                          style: TextStyle(
                            fontSize: 19,
                          ),
                        ),
                        Spacer(),
                        CupertinoSwitch(
                          value: powerOn,
                          onChanged: (value) {
                            setState(() {
                              powerOn = value;
                            });
                          },
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Constants.shadowColor,
                          Constants.backgroundColor,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.3, 0.6],
                      ),
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(5, 5),
                          blurRadius: 15,
                          spreadRadius: 2,
                        ),
                        BoxShadow(
                          color: Constants.backgroundColor,
                          offset: Offset(-5, -5),
                          blurRadius: 10,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                  ),
                  SizedBox(height: height / 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
