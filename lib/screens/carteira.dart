import 'package:flutter/material.dart';
import 'package:telalogin/screens/carteira.dart';
import 'package:telalogin/screens/inicio.dart';

class Carteira extends StatefulWidget {
  const Carteira({Key? key});

  @override
  State<Carteira> createState() => _CarteiraState();
}

class _CarteiraState extends State<Carteira> {
  // Dados do usuário
  final String nome = 'João da Silva';
  final String email = 'joao.silva@example.com';
  final String dataNascimento = '01/01/1990';
  final String codigo = '123456';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          // Dados do Usuário
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Card(
              color: Colors.blue[900],
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      'Nome',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    subtitle: Text(
                      nome,
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                    contentPadding: EdgeInsets.all(20),
                  ),
                  ListTile(
                    title: Text(
                      'Email',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    subtitle: Text(
                      email,
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                    contentPadding: EdgeInsets.all(20),
                  ),
                  ListTile(
                    title: Text(
                      'Data de Nascimento',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    subtitle: Text(
                      dataNascimento,
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                    contentPadding: EdgeInsets.all(20),
                  ),
                  ListTile(
                    title: Text(
                      'Código',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    subtitle: Text(
                      codigo,
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                    contentPadding: EdgeInsets.all(20),
                  ),
                ],
              ),
            ),
          ),
          // Menu Inferior
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(Icons.home),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => Inicio()),
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.directions_bus),
                    onPressed: () {
                      // Navegar para a página Linhas de Ônibus
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.account_balance_wallet),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => Carteira()),
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.credit_card),
                    onPressed: () {
                      // Navegar para a página Linhas de Ônibus
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
