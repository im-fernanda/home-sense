import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../../utils/card_builder.dart';

class ExternoScreen extends StatefulWidget {
  const ExternoScreen({super.key});

  @override
  State<ExternoScreen> createState() => _ExternoScreenState();
}

class _ExternoScreenState extends State<ExternoScreen> {

  final DatabaseReference _db = FirebaseDatabase.instance.ref();

  // Estados para os switches
  bool ledEnabled = false;
  int luminosidadeValue = 0; // Exemplo de valor de luminosidade

  void _captarInfos() {
    _db.child("comodos/area-externa/sensores/luminosidade").onValue.listen((event) {
      if (event.snapshot.value != null) {
        setState(() {
          luminosidadeValue = event.snapshot.value as int;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _captarInfos(); // Chama a função para iniciar a captura dos dados do Firebase
  }

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
                      _db.child("comodos/area-externa/atuadores/lampada/on").set(value);
                      setState(() {
                        ledEnabled = value;
                      });
                    },
                  ),
                  CardBuilder.buildDeviceCard(
                    title: 'Luminosidade',
                    value: '$luminosidadeValue %', // Valor de luminosidade
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
