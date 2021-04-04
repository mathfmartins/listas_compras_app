import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lista_compras_app/views/comidas.page.dart';
import 'package:lista_compras_app/views/higiene.pessoal.page.dart';

import 'bebidas.page.dart';
import 'lista.compras.page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // brightness: Brightness.dark,
        // primaryColorBrightness: Brightness.light
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => ListaComprasPage(),
        '/comidas': (context) => ComidasPage(),
        '/bebidas': (context) => BebidasPage(),
        '/higienePessoal': (context) => HigienePessoalPage(),
      },
    );
      
  }
}