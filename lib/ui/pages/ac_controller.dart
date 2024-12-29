import 'package:flutter/material.dart';

class AcController extends StatefulWidget {
  const AcController({super.key});

  @override
  State<AcController> createState() => _AcControllerState();
}

class _AcControllerState extends State<AcController> {
  Color color = Colors.lightBlueAccent;
  double temperature = 22;
  bool isSwitchedOn = false;
  bool autoAdjustment = false;
  int selectedMode = 0;

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
                            _getModeName(selectedMode),
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
                    min: 10,
                    max: 30,
                    divisions: 20,
                    activeColor: color,
                    inactiveColor: Colors.grey[300],
                    label: '${temperature.toInt()}°',
                    onChanged: (value) {
                      setState(() {
                        temperature = value;
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
        return Icons.ac_unit; // Cool Mode
      case 1:
        return Icons.air; // Dry Mode
      case 2:
        return Icons.eco; // Eco Mode
      case 3:
        return Icons.bolt; // Turbo Mode
      default:
        return Icons.help;
    }
  }

  String _getModeName(int index) {
    switch (index) {
      case 0:
        return "COOL MODE"; // Cool Mode
      case 1:
        return "DRY MODE"; // Dry Mode
      case 2:
        return "ECO MODE"; // Eco Mode
      case 3:
        return "TURBO MODE"; // Turbo Mode
      default:
        return "ERROR";
    }
  }
}
