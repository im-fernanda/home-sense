import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../utils/card_builder.dart';

class CozinhaScreen extends StatefulWidget {
  const CozinhaScreen({super.key});

  @override
  State<CozinhaScreen> createState() => _CozinhaScreenState();
}

class _CozinhaScreenState extends State<CozinhaScreen> {
  // Estados para os switches
  bool lampadaEnabled = false;
  String temperatura = '22°C';
  String umidade = '60%';
  String luminosidade = '0';

  final DatabaseReference _db = FirebaseDatabase.instance.ref();

  @override
  void initState() {
    super.initState();
    _captarLuminosidade();
  }

  void _captarLuminosidade() {
    _db.child("comodos/cozinha/sensores/luminosidade").onValue.listen((event) {
      if (event.snapshot.value != null) {
        setState(() {
          luminosidade = "${event.snapshot.value}%";
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cozinha"),
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
                  image: AssetImage('assets/images/cozinha_img.jpg'),
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
                  CardBuilder.buildDeviceCard(
                    title: 'Lâmpada',
                    value: '',
                    icon: Icons.lightbulb,
                    switchValue: lampadaEnabled,
                    onSwitchChanged: (value) {
                      setState(() {
                        lampadaEnabled = value;
                      });
                    },
                  ),
                  CardBuilder.buildDeviceCard(
                    title: 'Temperatura',
                    value: temperatura,
                    icon: Icons.thermostat,
                  ),
                  CardBuilder.buildDeviceCard(
                    title: 'Umidade',
                    value: umidade,
                    icon: Icons.water_drop,
                  ),
                  CardBuilder.buildDeviceCard(
                    title: 'Luminosidade',
                    value: luminosidade,
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
