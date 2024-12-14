import 'package:flutter/material.dart';

import 'home_page.dart';
import 'rotinas_page.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {

  int _selectedIndex = 0;
  final List<String> rooms = ["Sala", "Quarto", "Cozinha", "Banheiro", "Garagem"];
  static const List<Widget> _options = <Widget>[
    HomePage(),
    RotinasPage(),
    PerfilPage()
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
        child: Text("Perfil"),
      ),
    );
  }
}