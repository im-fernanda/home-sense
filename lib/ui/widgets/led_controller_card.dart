import 'package:flutter/material.dart';

class LedControllerCard extends StatelessWidget {
  final String title;
  final String status;
  final Color circleColor;
  final Color iconColor;

  const LedControllerCard({
    super.key,
    required this.title,
    required this.status,
    required this.circleColor,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80, // Ajusta a altura do card
      width: 150,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center, // Centraliza o conteúdo verticalmente
            children: [
              // Ícone dentro do círculo menor
              CircleAvatar(
                radius: 16, // Tamanho reduzido
                backgroundColor: circleColor.withOpacity(0.2),
                child: Icon(
                  Icons.lightbulb,
                  size: 16, // Ícone menor
                  color: iconColor,
                ),
              ),
              const SizedBox(width: 12), // Espaçamento ajustado
              // Título e status
              Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Alinhamento à esquerda
                mainAxisAlignment: MainAxisAlignment.center, // Centraliza verticalmente
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14, // Tamanho ajustado do título
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    status,
                    style: TextStyle(
                      fontSize: 12, // Tamanho ajustado do status
                      color: Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
