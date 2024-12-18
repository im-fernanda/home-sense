import 'package:flutter/material.dart';
import 'package:home_sense/ui/pages/led_rbg_screen.dart';

import '../pages/rooms/ar_control_screen.dart';

abstract class CardBuilder {
  static Widget buildDeviceCard({
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

  static Widget buildRGBLedCard({
    required String title,
    required String value,
    required IconData icon,
    required String thisScreen,
    required BuildContext context,
    bool? switchValue, // Opcional para dispositivos com switches
    void Function(bool)? onSwitchChanged, // Callback para alternar switches
  }) {
    return GestureDetector(
      onTap: (switchValue == true)
          ? () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LedRGBScreen(thisScreen: thisScreen,)));
            }
          : null,
      child: Card(
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
      ),
    );
  }

  static Widget buildArCard({
    required String title,
    required String value,
    required IconData icon,
    required BuildContext context,
    bool? switchValue, // Opcional para dispositivos com switches
    void Function(bool)? onSwitchChanged, // Callback para alternar switches
  }) {
    return GestureDetector(
      onTap: (switchValue == true)
          ? () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ArControlScreen())); // Navegar para a tela de controle do ar-condicionado
            }
          : null,
      child: Card(
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
      ),
    );
  }
}
