import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../utils/card_builder.dart';

class SalaScreen extends StatefulWidget {
  const SalaScreen({super.key});

  @override
  State<SalaScreen> createState() => _SalaScreenState();
}

class _SalaScreenState extends State<SalaScreen> {
  // Estados para os switches
  bool lampadaEnabled = false;
  int luminosidade = 0;

  final DatabaseReference _db = FirebaseDatabase.instance.ref();

  void _captarInfos() {
    _db.child("comodos/sala/sensores/luminosidade").onValue.listen((event) {
      if (event.snapshot.value != null) {
        setState(() {
          luminosidade = event.snapshot.value as int;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _captarInfos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sala"),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Imagem do ambiente
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: const DecorationImage(
                  image: AssetImage('assets/images/sala_img.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Informações dos dispositivos
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: [
                  CardBuilder.buildRGBLedCard(
                    title: 'Lâmpada',
                    value: '',
                    icon: Icons.lightbulb,
                    thisScreen: "sala",
                    context: context,
                    switchValue: lampadaEnabled,
                    onSwitchChanged: (value) {
                      _db.child("comodos/sala/atuadores/lampada-rgb/on").set(value);
                      setState(() {
                        lampadaEnabled = value;
                      });
                    },
                  ),
                  CardBuilder.buildDeviceCard(
                    title: 'Luminosidade',
                    value: "$luminosidade %",
                    icon: Icons.wb_sunny,
                  ),
                  CardBuilder.buildDeviceCard(
                    title: 'Rotina',
                    value: "$luminosidade %",
                    icon: Icons.wb_sunny,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
