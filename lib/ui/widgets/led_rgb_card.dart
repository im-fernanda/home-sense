import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class LedRgbCard extends StatefulWidget {
  const LedRgbCard({
    super.key,
  });

  @override
  State<LedRgbCard> createState() => _LedRgbCardState();
}

class _LedRgbCardState extends State<LedRgbCard> {
  Color color = Colors.amber;
  bool light = false;

  Widget _buildColorPicker() => BlockPicker(
        pickerColor: color,
        availableColors: [
          Colors.red,
          Colors.green,
          Colors.blue,
          Colors.white,
          Colors.orange,
          Colors.lightGreenAccent,
          Colors.lightBlueAccent,
          Colors.white,
          Colors.yellow,
          Colors.cyanAccent,
          Colors.purple,
          Colors.white
        ],
        onColorChanged: (color) => setState(() => this.color = color),
      );

  void _pickColor(BuildContext context) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Pick your light color"),
          content: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 220,
                  child: _buildColorPicker(),
                ),
                SizedBox(height: 16),
                TextButton(
                  child: Text(
                    "Select",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onLongPress: () {
          _pickColor(context);
        },
        child: Container(
          height: 180,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 247, 247, 247),
              borderRadius: BorderRadius.circular(33)),
          child: Column(
            children: [
              Text("Luminosidade"),
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
                  )
                ],
              ),
              SizedBox(height: 12),
              Container(
                height: 1,
                width: double.infinity,
                color: Colors.black12,
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Lâmpada",
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
                        activeColor: color,
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
    );
  }
}
