import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class RoutineLedRgbCard extends StatefulWidget {
  RoutineLedRgbCard({
    super.key,
    required this.routineTitle
  });

  String routineTitle;

  @override
  State<RoutineLedRgbCard> createState() => _RoutineLedRgbCardState();
}

class _RoutineLedRgbCardState extends State<RoutineLedRgbCard> {

  final DatabaseReference _db = FirebaseDatabase.instance.ref();

  bool light = false;
  Color color = Colors.amber;

  void _changeDbColor(Color color) {
    switch(color) {
      case Colors.red:
        _db.child("rotinas/${widget.routineTitle.toLowerCase()}/quarto/lampada-rgb/cor").set("Vermelho");
      break;
      case Colors.green:
        _db.child("rotinas/${widget.routineTitle.toLowerCase()}/quarto/lampada-rgb/cor").set("Verde");
      break;
      case Colors.blue:
        _db.child("rotinas/${widget.routineTitle.toLowerCase()}/quarto/lampada-rgb/cor").set("Azul");
      break;
      case Colors.orange:
        _db.child("rotinas/${widget.routineTitle.toLowerCase()}/quarto/lampada-rgb/cor").set("Laranja");
      break;
      case Colors.lightGreenAccent:
        _db.child("rotinas/${widget.routineTitle.toLowerCase()}/quarto/lampada-rgb/cor").set("Verde Claro");
      break;
      case Colors.lightBlueAccent:
        _db.child("rotinas/${widget.routineTitle.toLowerCase()}/quarto/lampada-rgb/cor").set("Azul Claro");
      break;
      case Colors.yellow:
        _db.child("rotinas/${widget.routineTitle.toLowerCase()}/quarto/lampada-rgb/cor").set("Amarelo");
      break;
      case Colors.cyanAccent:
        _db.child("rotinas/${widget.routineTitle.toLowerCase()}/quarto/lampada-rgb/cor").set("Ciano");
      break;
      case Colors.purple:
        _db.child("rotinas/${widget.routineTitle.toLowerCase()}/quarto/lampada-rgb/cor").set("Roxo");
      break;
      default:
        _db.child("rotinas/${widget.routineTitle.toLowerCase()}/quarto/lampada-rgb/cor").set("Branco");
      break;
    }

    setState(() {
      this.color = color;
    });
  }

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
    onColorChanged: (color) => setState(() => _changeDbColor(color) ),
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
    return GestureDetector(
      onLongPress: () {
        _pickColor(context);
      },
      child: SizedBox(
        height: 160,
        width: 160,
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
                  Icon(
                    Icons.lightbulb_outline,
                    color: Colors.black,
                    size: 30,
                  ),
                  SizedBox(width: 8),
                  Text(
                    "Lâmpada",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),  
                  )
                ],
              ),
              SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                            _db.child("rotinas/${widget.routineTitle.toLowerCase()}/quarto/lampada-rgb/on").set(value);
                            light = value;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}