import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';

import '../../services/database_service.dart';

class LedRgbCard extends StatefulWidget {
  LedRgbCard({super.key, required this.comodo});

  String comodo;

  @override
  State<LedRgbCard> createState() => _LedRgbCardState();
}

class _LedRgbCardState extends State<LedRgbCard> {
  final DatabaseReference _db = FirebaseDatabase.instance.ref();

  Color color = Colors.amber;
  bool light = false;
  int brightness = 0;

  void _changeDbColor(Color color) {
    switch (color) {
      case Colors.red:
        _db
            .child("comodos/${widget.comodo}/atuadores/lampada-rgb/cor")
            .set("Vermelho");
        break;
      case Colors.green:
        _db
            .child("comodos/${widget.comodo}/atuadores/lampada-rgb/cor")
            .set("Verde");
        break;
      case Colors.blue:
        _db
            .child("comodos/${widget.comodo}/atuadores/lampada-rgb/cor")
            .set("Azul");
        break;
      case Colors.orange:
        _db
            .child("comodos/${widget.comodo}/atuadores/lampada-rgb/cor")
            .set("Laranja");
        break;
      case Colors.lightGreenAccent:
        _db
            .child("comodos/${widget.comodo}/atuadores/lampada-rgb/cor")
            .set("Verde Claro");
        break;
      case Colors.lightBlueAccent:
        _db
            .child("comodos/${widget.comodo}/atuadores/lampada-rgb/cor")
            .set("Azul Claro");
        break;
      case Colors.yellow:
        _db
            .child("comodos/${widget.comodo}/atuadores/lampada-rgb/cor")
            .set("Amarelo");
        break;
      case Colors.cyanAccent:
        _db
            .child("comodos/${widget.comodo}/atuadores/lampada-rgb/cor")
            .set("Ciano");
        break;
      case Colors.purple:
        _db
            .child("comodos/${widget.comodo}/atuadores/lampada-rgb/cor")
            .set("Roxo");
        break;
      default:
        _db
            .child("comodos/${widget.comodo}/atuadores/lampada-rgb/cor")
            .set("Branco");
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
        onColorChanged: (color) => setState(() => _changeDbColor(color)),
      );

  void _pickColor(BuildContext context) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Escolha a cor"),
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
                    "Confirmar",
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

  void _getDbInfo() {
    _db
        .child("comodos/${widget.comodo}/atuadores/lampada-rgb/on")
        .onValue
        .listen((event) {
      final data = event.snapshot.value as bool;
      setState(() {
        light = data;
      });
    });

    _db
        .child("comodos/${widget.comodo}/sensores/luminosidade")
        .onValue
        .listen((event) {
      final data = event.snapshot.value as int;
      setState(() {
        brightness = data;
      });
    });

    _db
        .child("comodos/${widget.comodo}/atuadores/lampada-rgb/cor")
        .onValue
        .listen((event) {
      final data = event.snapshot.value as String;
      setState(() {
        switch (data) {
          case "Vermelho":
            color = Colors.red;
            break;
          case "Verde":
            color = Colors.green;
            break;
          case "Azul":
            color = Colors.blue;
            break;
          case "Laranja":
            color = Colors.orange;
            break;
          case "Verde Claro":
            color = Colors.lightGreenAccent;
            break;
          case "Azul Claro":
            color = Colors.lightBlueAccent;
            break;
          case "Amarelo":
            color = Colors.yellow;
            break;
          case "Ciano":
            color = Colors.cyanAccent;
            break;
          case "Roxo":
            color = Colors.purple;
            break;
          default:
            color = Colors.white;
            break;
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _getDbInfo();
  }

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
                    "$brightness%",
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
                            _db
                                .child(
                                    "comodos/${widget.comodo}/atuadores/lampada-rgb/on")
                                .set(value);
                            _db.child("rotinas/chegada/on").set(false);
                            _db.child("rotinas/saida/on").set(false);
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
