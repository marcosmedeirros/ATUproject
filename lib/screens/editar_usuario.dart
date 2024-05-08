import 'package:flutter/material.dart';
import 'package:telalogin/screens/carteira.dart';

class EditarUsuario extends StatefulWidget {
  @override
  _EditarUsuarioState createState() => _EditarUsuarioState();
}

class _EditarUsuarioState extends State<EditarUsuario> {
  // Dados do usuário
  String nome = 'João da Silva';
  String email = 'joao.silva@example.com';
  String dataNascimento = '01/01/1990';
  String codigo = '123456';

  // Controladores para os campos de texto
  TextEditingController nomeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dataNascimentoController = TextEditingController();
  TextEditingController codigoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Preencher os controladores com os dados do usuário
    nomeController.text = nome;
    emailController.text = email;
    dataNascimentoController.text = dataNascimento;
    codigoController.text = codigo;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Usuário'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: nomeController,
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: dataNascimentoController,
              decoration: InputDecoration(labelText: 'Data de Nascimento'),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: codigoController,
              decoration: InputDecoration(labelText: 'Código'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[900], // Define a cor de fundo como Azul(900)
              ),
              onPressed: () {
                // Atualizar os dados do usuário com os valores dos controladores
                setState(() {
                  nome = nomeController.text;
                  email = emailController.text;
                  dataNascimento = dataNascimentoController.text;
                  codigo = codigoController.text;
                });
                // Exibir um snackbar ou outra ação para confirmar a atualização
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Dados do usuário atualizados!'),
                  ),
                );
                // Retornar à página Carteira
                Navigator.pop(context);
              },
              child: Text(
                'Salvar Alterações',
                style: TextStyle(color: Colors.white), // Define a cor do texto como branco
              ),
            ),
          ],
        ),
      ),
    );
  }
}
