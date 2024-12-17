import 'package:flutter/material.dart';

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
                  _buildDeviceCard(
                    title: 'Lâmpada',
                    value: '', // Deixe o valor vazio ou removido
                    icon: Icons.lightbulb,
                    switchValue: lampadaEnabled,
                    onSwitchChanged: (value) {
                      setState(() {
                        lampadaEnabled = value;
                      });
                    },
                  ),
                  _buildDeviceCard(
                    title: 'Temperatura',
                    value: temperatura,
                    icon: Icons.thermostat,
                  ),
                  _buildDeviceCard(
                    title: 'Umidade',
                    value: umidade,
                    icon: Icons.water_drop,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Método auxiliar para construção do card
  Widget _buildDeviceCard({
    required String title,
    required String value,
    required IconData icon,
    bool? switchValue, // Opcional para dispositivos com switches
    void Function(bool)? onSwitchChanged, // Callback para alternar switches
  }) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Ícone centralizado
          Icon(icon, size: 40, color: Colors.black),
          const SizedBox(height: 10),
          // Título do dispositivo
          Text(
            title,
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 5),
          // Linha contendo o Switch e o valor
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Switch somente para dispositivos com switch
              if (switchValue != null && onSwitchChanged != null) ...[
                Switch(
                  value: switchValue,
                  onChanged: onSwitchChanged,
                ),
              ],
              // Exibindo o valor (Temperatura, Umidade, etc.)
              Text(
                value,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
