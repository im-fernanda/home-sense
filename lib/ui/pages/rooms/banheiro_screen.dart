import 'package:flutter/material.dart';

class BanheiroScreen extends StatelessWidget {
  const BanheiroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Banheiro"),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),

      body: const Center(
        child: Text("Banheiro"),
      ),
    );
  }
}