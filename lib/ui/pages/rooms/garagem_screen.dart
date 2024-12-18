import 'package:flutter/material.dart';

import '../../utils/card_builder.dart';

class GaragemScreen extends StatefulWidget {
  const GaragemScreen({super.key});

  @override
  State<GaragemScreen> createState() => _GaragemScreenState();
}

class _GaragemScreenState extends State<GaragemScreen> {
  // Estados para os switches
  bool ledEnabled = false;
  bool portaoAberto = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Garagem"),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Imagem da garagem
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: const DecorationImage(
                  image: AssetImage('assets/images/garagem_img.jpg'),
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
                    // Deixe o valor vazio ou removido
                    icon: Icons.lightbulb,
                    switchValue: ledEnabled,
                    onSwitchChanged: (value) {
                      setState(() {
                        ledEnabled = value;
                      });
                    },
                  ),
                  CardBuilder.buildDeviceCard(
                    title: 'Abrir Portão',
                    value: '',
                    // Não há valor para esse dispositivo
                    icon: Icons.door_front_door,
                    switchValue: portaoAberto,
                    onSwitchChanged: (value) {
                      setState(() {
                        portaoAberto = value;
                      });
                    },
                  ),
                  CardBuilder.buildDeviceCard(
                    title: 'Fechar Portão',
                    value: '',
                    // Não há valor para esse dispositivo
                    icon: Icons.lock_open,
                    switchValue: !portaoAberto,
                    // Controle se o portão está aberto ou fechado
                    onSwitchChanged: (value) {
                      setState(() {
                        portaoAberto = !value;
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
