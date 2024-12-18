import 'package:firebase_database/firebase_database.dart';
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

  final DatabaseReference _db = FirebaseDatabase.instance.ref();

  double temperatura = 15;
  double minTemperatura = 14;
  double maxTemperatura = 30;
  int tempInt = 0;

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

  Future<void> _loadInitialTemperature() async {
    try {
      final snapshot = await _db.child("comodos/quarto/atuadores/ar-condicionado/valor").once();
      final value = snapshot.snapshot.value;
      if (value != null) {
        setState(() {
          temperatura = (value as num).toDouble();
        });
      }
    } catch (e) {
      debugPrint("Erro ao carregar temperatura: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    _loadInitialTemperature();
  }

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
                          temperatura.toStringAsFixed(0),
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
                        min: minTemperatura,
                        max: maxTemperatura,
                        value: temperatura,
                        onChanged: (value) {
                          tempInt = value.toInt();
                          _db.child("comodos/quarto/atuadores/ar-condicionado/valor").set(tempInt);
                          setState(() {
                            temperatura = value;
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
                                if (temperatura > minTemperatura &&
                                    temperatura < maxTemperatura) {
                                  setState(() {
                                    --temperatura;
                                  });
                                }
                              },
                              icon: Icon(
                                Icons.arrow_left,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                if (temperatura > minTemperatura &&
                                    temperatura < maxTemperatura) {
                                  setState(() {
                                    ++temperatura;
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
                      separatorBuilder: (context, index) => SizedBox(width: 30),
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
