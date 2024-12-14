import 'package:flutter/material.dart';

class GaragemScreen extends StatelessWidget {
  const GaragemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Garagem"),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),

      body: const Center(
        child: Text("Garagem"),
      ),
    );
  }
}