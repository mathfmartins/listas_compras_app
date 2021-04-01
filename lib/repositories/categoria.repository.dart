import 'package:flutter/material.dart';
import 'package:lista_compras_app/models/produto.dart';

class CategoriasRepository {
  // ignore: deprecated_member_use
   static List<Categoria> categorias = List<Categoria>();

  CategoriasRepository() {
    if (categorias.isEmpty) {
      categorias.add(Categoria(nome: 'Comidas', icone: Icons.food_bank_outlined));
      categorias.add(Categoria(nome: 'Bebidas', icone: Icons.sports_bar_outlined));
      categorias.add(Categoria(nome: 'Higiene Pessoal', icone: Icons.clean_hands));
      categorias.add(Categoria(nome: 'Frios', icone: Icons.ac_unit));
    } 
  }

  List<Categoria> read() {
    return categorias; 
  }

}
