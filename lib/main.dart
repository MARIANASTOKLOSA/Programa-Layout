import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Programa Layout Motivador', // Atualizar o nome do programa
      debugShowCheckedModeBanner: false, // Remover o banner de debug
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Programa Layout Motivador'), // Atualizar o título
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Cor do botão "Sair"
              ),
              child: const Text('Sair'),
            ),
          ],
        ),
        backgroundColor: Colors.purpleAccent, // Cor da faixa lilás
      ),
      body: const Center(
        child: SingleChildScrollView(
          // Adicionar SingleChildScrollView
          child: InteractiveBoard(),
        ),
      ),
    );
  }
}

class InteractiveBoard extends StatefulWidget {
  const InteractiveBoard({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _InteractiveBoardState createState() => _InteractiveBoardState();
}

class _InteractiveBoardState extends State<InteractiveBoard> {
  String _displayText =
      'Bem-vindo ao nosso aplicativo! Clique no botão abaixo para continuar.';

  // Lista de mensagens motivadoras
  final List<String> _messages = [
    'Você é incrível!',
    'Continue brilhando!',
    'Acredite em você!',
    'Cada dia é uma nova oportunidade!',
    'Você pode fazer grandes coisas!'
  ];

  void _updateText() {
    setState(() {
      // Seleciona uma mensagem aleatória da lista
      _displayText = _messages[Random().nextInt(_messages.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 300, // Largura do quadro
            height: 400, // Altura do quadro
            margin:
                const EdgeInsets.all(20), // Margem para não encostar nas bordas
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.lightBlue,
              border: Border.all(
                color: Colors.black,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Text(
                _displayText,
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 40), // Espaço maior entre os elementos
          ElevatedButton(
            onPressed: _updateText,
            child: const Text('Clique aqui'),
          ),
        ],
      ),
    );
  }
}
