import 'package:flutter/material.dart';

import 'home_page.dart';

class RotinasPage extends StatefulWidget {
  const RotinasPage({super.key});

  @override
  State<RotinasPage> createState() => _RotinasPageState();
}

class _RotinasPageState extends State<RotinasPage> {

  int _selectedIndex = 0;
  final List<String> rooms = ["Sala", "Quarto", "Cozinha", "Banheiro", "Garagem"];
  static const List<Widget> _options = <Widget>[
    HomePage(),
    RotinasPage(),
    Text('Perfil')
  ];

  void _onItemSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void handleScreenChanged(int selectedScreen) {
    setState(() {
      _selectedIndex = selectedScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Rotinas"),
      ),
    );
  }
}