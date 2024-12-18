import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../../utils/card_builder.dart';

class BanheiroScreen extends StatefulWidget {
  const BanheiroScreen({super.key});

  @override
  State<BanheiroScreen> createState() => _BanheiroScreenState();
}

class _BanheiroScreenState extends State<BanheiroScreen> {

  final DatabaseReference _db = FirebaseDatabase.instance.ref();

  // Estado para o switch do LED
  bool ledEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Banheiro"),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: const DecorationImage(
                  image: AssetImage('assets/images/banheiro_img.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Informações dos dispositivos
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: CardBuilder.buildDeviceCard(
                  title: 'Lâmpada',
                  value: '', // Deixe o valor vazio ou removido
                  icon: Icons.lightbulb,
                  switchValue: ledEnabled,
                  onSwitchChanged: (value) {
                    _db.child("comodos/banheiro/atuadores/lampada/on").set(value);
                    setState(() {
                      ledEnabled = value;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
