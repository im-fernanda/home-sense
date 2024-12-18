import 'package:flutter/material.dart';

import '../widgets/room_card.dart';
import 'perfil_page.dart';
import 'rotinas_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static final List<Widget> _options = <Widget>[
    const HomePageContent(),
    const RotinasPage(),
    const PerfilPage()
  ];

  void _onItemSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Sense"),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: _options[
          _selectedIndex], // Troca de telas com base no índice selecionado
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Cômodos'),
          NavigationDestination(
              icon: Icon(Icons.access_time_filled), label: 'Rotinas'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Perfil'),
        ],
        onDestinationSelected: _onItemSelected,
        selectedIndex: _selectedIndex,
      ),
    );
  }
}

// Componente para a página inicial (apenas os cards de salas)

class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    final rooms = [
      "Sala",
      "Quarto",
      "Cozinha",
      "Banheiro",
      "Garagem",
      "Externo"
    ];

    final List<int> dispositivosConectados = [
      3, // Sala
      4, // Quarto
      3, // Cozinha
      1, // Banheiro
      1, // Garagem
      2, // Externo
    ];

    return ListView.builder(
      itemCount: rooms.length,
      itemBuilder: (context, index) {
        return RoomCard(
          rooms: rooms,
          index: index,
          dispositivosConectados: dispositivosConectados,
        );
      },
    );
  }
}
