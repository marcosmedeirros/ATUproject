import 'package:flutter/material.dart';
import 'package:telalogin/screens/inicio.dart';
import 'package:telalogin/screens/mapa.dart';
import 'package:telalogin/screens/recarga.dart';

class Carteira extends StatefulWidget {
  const Carteira({Key? key});

  @override
  State<Carteira> createState() => _CarteiraState();
}

class _CarteiraState extends State<Carteira> {
  // Dados do usuário
  String nome = 'Marcos Medeiros';
  String email = 'marcos@gmail.com';
  String dataNascimento = '01/05/2023';
  String codigo = '123456';

  // Função para exibir o popup de edição
  void _showEditDialog() {
    TextEditingController nomeController = TextEditingController(text: nome);
    TextEditingController emailController = TextEditingController(text: email);
    TextEditingController dataNascimentoController = TextEditingController(text: dataNascimento);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Editar Usuário'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nomeController,
                decoration: InputDecoration(labelText: 'Nome'),
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: dataNascimentoController,
                decoration: InputDecoration(labelText: 'Data de Nascimento'),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                setState(() {
                  nome = nomeController.text;
                  email = emailController.text;
                  dataNascimento = dataNascimentoController.text;
                });
                Navigator.of(context).pop();
              },
              child: Text('Salvar', style: TextStyle(color: Colors.white)),
              style: TextButton.styleFrom(backgroundColor: Colors.blue[900]),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar', style: TextStyle(color: Colors.white)),
              style: TextButton.styleFrom(backgroundColor: Colors.blue[900]),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carteira'),
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
          // Botão para editar usuário
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue[900], // Define a cor do botão como Azul(900)
            ),
            onPressed: _showEditDialog,
            child: Text(
              'Editar Usuário',
              style: TextStyle(color: Colors.white), // Define a cor do texto como branco
            ),
          ),

          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Colors.blue[900],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Icon(Icons.home, color: Colors.white),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => Inicio()),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.directions_bus, color: Colors.white),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => Mapa()),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.account_balance_wallet, color: Colors.white),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => Carteira()),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.credit_card, color: Colors.white),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => Recarga()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
