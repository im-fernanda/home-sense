import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../../widgets/led_controller_card.dart';

class SalaScreen extends StatefulWidget {
  const SalaScreen({super.key});

  @override
  State<SalaScreen> createState() => _SalaScreenState();
}

class _SalaScreenState extends State<SalaScreen> {
  String _status = "Desligado";
  dynamic _circleColor = Colors.grey;
  dynamic _iconColor = Colors.grey;

  final DatabaseReference _db = FirebaseDatabase.instance.ref();

  void _ledHandle(BuildContext context) {
    setState(() {
      if (_status == "Desligado") {
        _status = "Ligado";
        _db.child("sala/atuadores/led").set(true);
        _circleColor = Theme.of(context).colorScheme.primaryContainer;
        _iconColor = Theme.of(context).colorScheme.primary;
        return;
      }
      _status = "Desligado";
      _db.child("sala/atuadores/led").set(false);
      _circleColor = Colors.grey;
      _iconColor = Colors.grey;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sala"),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: Center(
        child: GestureDetector(
            onTap: () => _ledHandle(context),
            child: LedControllerCard(
              title: "Lâmpada",
              status: _status,
              circleColor: _circleColor,
              iconColor: _iconColor,
            )),
      ),
    );
  }
}
