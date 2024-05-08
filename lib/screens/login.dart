import 'package:flutter/material.dart';
import 'package:telalogin/screens/carteira.dart';
import 'package:telalogin/screens/inicio.dart';
import 'package:telalogin/screens/criesuaconta.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60.0, bottom: 10),
                child: Center(
                  child: Container(
                    height: 300,
                    width: 350,
                    child: Image.asset('assets/images/logobus.png'),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    labelText: 'Email',
                    hintText: 'Entre com email Valido',
                    labelStyle: TextStyle(color: Colors.black),
                    hintStyle: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
                child: TextFormField(
                  validator: (valor) {
                    if (valor == null || valor.isEmpty) {
                      return 'Senha Invalida';
                    }
                    return null;
                  },
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Senha',
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  print('Screen esqueceu sua senha!');
                },
                child: const Text(
                  "Esqueceu sua Senha?",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
              Container(
                height: 50,
                width: 750,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.blue[900], borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                  onPressed: () {
                    print('Screen app Login');

                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => Inicio()),
                      );
                    }
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
              const SizedBox(
                height: 90,
              ),
              TextButton(
                onPressed: () {
                  print('usuario quer criar conta');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (valor) => const CrieSuaConta()),
                  );
                },
                child: const Text(
                  "Criar uma Conta",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
