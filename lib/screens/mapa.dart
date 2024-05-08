import 'package:flutter/material.dart';
import 'package:telalogin/screens/Recarga.dart';
import 'package:telalogin/screens/carteira.dart';
import 'package:telalogin/screens/inicio.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Mapa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa'),
      ),
      body: WebView(
        initialUrl: 'https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d13859.381324706193!2d-53.7050702!3d-29.724239199999996!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1spt-BR!2sbr!4v1715192835138!5m2!1spt-BR!2sbr',
        javascriptMode: JavascriptMode.unrestricted,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => Inicio()),
                  );
                },
              ),
            ),
            Expanded(
              child: IconButton(
                icon: Icon(Icons.directions_bus),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => Mapa()),
                  );
                },
              ),
            ),
            Expanded(
              child: IconButton(
                icon: Icon(Icons.account_balance_wallet),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => Carteira()),
                  );
                },
              ),
            ),
            Expanded(
              child: IconButton(
                icon: Icon(Icons.credit_card),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => Recarga()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
