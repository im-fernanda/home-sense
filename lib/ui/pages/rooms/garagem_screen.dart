import 'package:flutter/material.dart';

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
                  _buildDeviceCard(
                    title: 'LED',
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
                  _buildDeviceCard(
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
                  _buildDeviceCard(
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
          Icon(icon, size: 40, color: Colors.green),
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
