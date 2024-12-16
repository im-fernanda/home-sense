import 'package:flutter/material.dart';

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
                  _buildDeviceCard(
                    title: 'LED',
                    value: '', // Deixe o valor vazio ou removido
                    icon: Icons.lightbulb,
                    switchValue: ledEnabled,
                    onSwitchChanged: (value) {
                      setState(() {
                        ledEnabled = value;
                      });
                    },
                  ),
                  _buildDeviceCard(
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
          Icon(icon, size: 40, color: Colors.green),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 5),
          if (switchValue != null && onSwitchChanged != null) ...[
            Switch(
              value: switchValue,
              onChanged: onSwitchChanged,
            ),
          ],
          // Exibindo o valor abaixo do título
          const SizedBox(height: 2),
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
    );
  }
}
