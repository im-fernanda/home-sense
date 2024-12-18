import 'package:flutter/material.dart';
import 'package:home_sense/ui/pages/login_or_register_page.dart';
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

  void _logout(BuildContext context) {
    // Redireciona para a página LoginOrRegisterPage
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const LoginOrRegisterPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Sense"),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              _logout(context);
            },
            tooltip: 'Logout',
          ),
        ],
      ),
      body: _options[_selectedIndex],
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
      5, // Quarto
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
