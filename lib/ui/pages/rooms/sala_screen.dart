import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/led_rgb_control.dart';

class SalaScreen extends StatefulWidget {
  const SalaScreen({super.key});

  @override
  State<SalaScreen> createState() => _SalaScreenState();
}

class _SalaScreenState extends State<SalaScreen> {
  String _status = "Desligado";
  dynamic _circleColor = Colors.grey;
  dynamic _iconColor = Colors.grey;
  bool _movimento = false;

  final DatabaseReference _db = FirebaseDatabase.instance.ref();

  void captarMovimento() {
    _db.child("comodos/sala/sensores/movimento").onValue.listen((event) {
      if (event.snapshot.value != null) {
        setState(() {
          _movimento = event.snapshot.value as bool;
        });
      }
    });
  }

  void _ledHandle(BuildContext context) {
    setState(() {
      if (_status == "Desligado") {
        _status = "Ligado";
        _db.child("comodos/sala/atuadores/lampada-rgb/on").set(true);
        _circleColor = Theme.of(context).colorScheme.primaryContainer;
        _iconColor = Theme.of(context).colorScheme.primary;
        return;
      }
      _status = "Desligado";
      _db.child("comodos/sala/atuadores/lampada-rgb/on").set(false);
      _circleColor = Colors.grey;
      _iconColor = Colors.grey;
    });
  }

  @override
  void initState() {
    super.initState();
    captarMovimento(); // Chama a função para iniciar a captura dos dados do Firebase
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sala"),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: Center(
          child: Column(
        children: [
          GestureDetector(
              onTap: () => _ledHandle(context),
              child: LedRGBControl(
                title: "Lâmpada",
                status: _status,
                circleColor: _circleColor,
                iconColor: _iconColor,
              )),
          Text("Movimento: $_movimento"),
        ],
      )),
    );
  }
}
