import 'package:flutter/material.dart';

import '../../utils/card_builder.dart';

class ExternoScreen extends StatefulWidget {
  const ExternoScreen({super.key});

  @override
  State<ExternoScreen> createState() => _ExternoScreenState();
}

class _ExternoScreenState extends State<ExternoScreen> {
  // Estados para os switches
  bool ledEnabled = false;
  String luminosidadeValue = '50%'; // Exemplo de valor de luminosidade

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Externo"),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Imagem do ambiente externo
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: const DecorationImage(
                  image: AssetImage('assets/images/externo_img.jpg'),
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
                    value: '', // Deixe o valor vazio ou removido
                    icon: Icons.lightbulb,
                    switchValue: ledEnabled,
                    onSwitchChanged: (value) {
                      setState(() {
                        ledEnabled = value;
                      });
                    },
                  ),
                  CardBuilder.buildDeviceCard(
                    title: 'Luminosidade',
                    value: luminosidadeValue, // Valor de luminosidade
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
