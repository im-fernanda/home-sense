import 'package:flutter/material.dart';

class QuartoScreen extends StatelessWidget {
  const QuartoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quarto"),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),

      body: const Center(
        child: Text("Quarto"),
      ),
    );
  }
}