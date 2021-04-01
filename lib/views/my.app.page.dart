import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lista_compras_app/views/comidas.page.dart';

import 'lista.compras.page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.pink,
      routes: {
        '/': (context) => ListaComprasPage(),
        '/comidas': (context) => ComidasPage()
      },
    );
      
  }
}