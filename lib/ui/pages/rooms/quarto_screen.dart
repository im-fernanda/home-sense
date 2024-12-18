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
  bool inicial = false; // Controle do switch do ar-condicionado
  int temperatura = 0;
  int umidade = 0;
  int luminosidade = 0;
  double arTemp = 0;

  final DatabaseReference _db = FirebaseDatabase.instance.ref();

  void _captarInfos() {
    _db.child("comodos/quarto/sensores/luminosidade").onValue.listen((event) {
      if (event.snapshot.value != null) {
        setState(() {
          luminosidade = event.snapshot.value as int;
        });
      }
    });

    _db.child("comodos/quarto/sensores/umidade").onValue.listen((event) {
      if (event.snapshot.value != null) {
        setState(() {
          umidade = event.snapshot.value as int;
        });
      }
    });

    _db.child("comodos/quarto/sensores/temperatura").onValue.listen((event) {
      if (event.snapshot.value != null) {
        setState(() {
          temperatura = event.snapshot.value as int;
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
                    thisScreen: "quarto",
                    context: context,
                    switchValue: lampadaEnabled,
                    onSwitchChanged: (value) {
                      _db.child("comodos/quarto/atuadores/lampada-rgb/on").set(value);
                      setState(() {
                        lampadaEnabled = value;
                      });
                    },
                  ),
                  CardBuilder.buildDeviceCard(
                    title: 'Temperatura',
                    value: "$temperatura C°",
                    icon: Icons.thermostat,
                  ),
                  CardBuilder.buildDeviceCard(
                    title: 'Umidade',
                    value: "$umidade %",
                    icon: Icons.water_drop,
                  ),
                  CardBuilder.buildDeviceCard(
                    title: 'Luminosidade',
                    value: "$luminosidade %",
                    icon: Icons.wb_sunny,
                  ),
                  CardBuilder.buildArCard(
                    title: 'Ar-condicionado',
                    value: '', // Adicione a lógica de valor se necessário (ex: temperatura do ar)
                    icon: Icons.ac_unit,
                    context: context,
                    switchValue: inicial,
                    onSwitchChanged: (value) {
                      _db.child("comodos/quarto/atuadores/ar-condicionado/on").set(value);
                      setState(() {
                        inicial = value;
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
