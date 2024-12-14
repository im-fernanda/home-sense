import 'package:flutter/material.dart';

class CozinhaScreen extends StatelessWidget {
  const CozinhaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cozinha"),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),

      body: const Center(
        child: Text("Cozinha"),
      ),
    );
  }
}