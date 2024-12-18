import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../utils/card_builder.dart';

class QuartoScreen extends StatefulWidget {
  const QuartoScreen({super.key});

  @override
  State<QuartoScreen> createState() => _QuartoScreenState();
}

class _QuartoScreenState extends State<QuartoScreen> {
  bool lampadaEnabled = false;
  bool inical = false; // Controle do switch do ar-condicionado
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
    _db.child("comodos/quarto/sensores/luminosidade").onValue.listen((event) {
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
        title: const Text("Quarto"),
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
                  image: AssetImage('assets/images/quarto_img.jpg'),
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
                    context: context,
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
                  CardBuilder.buildArCard(
                    title: 'Ar-condicionado',
                    value:
                        '', // Adicione a lógica de valor se necessário (ex: temperatura do ar)
                    icon: Icons.ac_unit,
                    context: context,
                    switchValue: inical,
                    onSwitchChanged: (value) {
                      setState(() {
                        inical = value;
                      });
                    },
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
