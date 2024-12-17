import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class QuartoScreen extends StatefulWidget {
  const QuartoScreen({super.key});

  @override
  State<QuartoScreen> createState() => _QuartoScreenState();
}

class _QuartoScreenState extends State<QuartoScreen> {
  String _statusAr = "desligado";
  int temp = 0;
  int umidade = 0;
  int luz = 0;

  final DatabaseReference _db = FirebaseDatabase.instance.ref();

  void captarInfos() {
    // Inicia a captura das informações do Firebase
    _db.child("comodos/quarto/sensores/luminosidade").onValue.listen((event) {
      if (event.snapshot.value != null) {
        setState(() {
          luz = event.snapshot.value as int;
        });
        print("Luz: $luz");
      }
    });

    _db.child("comodos/quarto/sensores/umidade").onValue.listen((event) {
      if (event.snapshot.value != null) {
        setState(() {
          umidade = event.snapshot.value as int;
        });
        print("Umidade: $umidade");
      }
    });

    _db.child("comodos/quarto/sensores/temperatura").onValue.listen((event) {
      if (event.snapshot.value != null) {
        setState(() {
          temp = event.snapshot.value as int;
        });
        print("Temperatura: $temp");
      }
    });
  }

  void arCondicionadoHandle() {
    setState(() {
      if (_statusAr == "desligado") {
        _statusAr = "ligado";
        _db.child("comodos/quarto/atuadores/ar-condicionado/on").set(true);
        _db.child("comodos/quarto/atuadores/ar-condicionado/valor").set(20);
        _db.child("comodos/quarto/atuadores/ar-condicionado/modo").set("Cool");
        return;
      }

      _statusAr = "desligado";
      _db.child("comodos/quarto/atuadores/ar-condicionado/on").set(false);
    });
  }

  @override
  void initState() {
    super.initState();
    captarInfos(); // Chama a função para iniciar a captura dos dados do Firebase
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quarto"),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => arCondicionadoHandle(),
              child: const Text("ON/OFF - AR"),
            ),
            Text("Temperatura: $temp"),
            Text("Umidade: $umidade"),
            Text("Luminosidade: $luz"),
          ],
        ),
      ),
    );
  }
}
