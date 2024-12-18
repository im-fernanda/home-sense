import 'package:flutter/material.dart';

import '../../utils/card_builder.dart';

class ChegadaScreen extends StatefulWidget {
  const ChegadaScreen({super.key});

  @override
  State<ChegadaScreen> createState() => _ChegadaScreenState();
}

class _ChegadaScreenState extends State<ChegadaScreen> {

  bool ledSalaEnabled = false;
  bool ledQuartoEnabled = false;
  bool ledCozinhaEnabled = false;
  bool ledBanheiroEnabled = false;
  bool ledExternoEnabled = false;
  bool ledGaragemEnabled = false;
  bool inicialAr = false;
  double arTemp = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chegada"),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text("Sala"),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: [
                  CardBuilder.buildDeviceCard(
                    title: 'Lâmpada',
                    value: '', // Deixe o valor vazio ou removido
                    icon: Icons.lightbulb,
                    switchValue: ledSalaEnabled,
                    onSwitchChanged: (value) {
                      // _db.child("comodos/area-externa/atuadores/lampada/on").set(value);
                      setState(() {
                        ledSalaEnabled = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            const Text("Quarto"),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: [
                  CardBuilder.buildRGBLedCard(
                    title: 'Lâmpada',
                    value: '', // Deixe o valor vazio ou removido
                    icon: Icons.lightbulb,
                    thisScreen: "quarto",
                    context: context,
                    switchValue: ledQuartoEnabled,
                    onSwitchChanged: (value) {
                      // _db.child("comodos/area-externa/atuadores/lampada/on").set(value);
                      setState(() {
                        ledQuartoEnabled = value;
                      });
                    },
                  ),
                  CardBuilder.buildArCard(
                    title: 'Ar-condicionado',
                    value: '', // Adicione a lógica de valor se necessário (ex: temperatura do ar)
                    icon: Icons.ac_unit,
                    context: context,
                    switchValue: inicialAr,
                    onSwitchChanged: (value) {
                     //  _db.child("comodos/quarto/atuadores/ar-condicionado/on").set(value);
                      setState(() {
                        inicialAr = value;
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
