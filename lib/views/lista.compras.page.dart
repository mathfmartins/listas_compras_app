import 'package:flutter/material.dart';
import 'package:lista_compras_app/models/produto.dart';
import 'package:lista_compras_app/repositories/categoria.repository.dart';
import 'package:lista_compras_app/repositories/comida.repository.dart';

class ListaComprasPage extends StatefulWidget {
  @override
  _ListaComprasPageState createState() => _ListaComprasPageState();
}

// bool canEdit = false;

class _ListaComprasPageState extends State<ListaComprasPage> {
  
  final repository = CategoriasRepository();
  final comidaRepository = ComidaRepository();

  var _categoriaCtrl = TextEditingController();
  // ignore: deprecated_member_use
  List<Categoria> _categorias;
  Categoria _categoria;
  
  @override
  initState() {
    super.initState();
    this._categorias = repository.read();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text("Lista de produtos"),
        centerTitle: true,
      ),
      body: 
          Align(
            alignment: Alignment(-0.9, 0.0),
            child: Container(
              child: ListView.builder(
                padding: EdgeInsets.only(top: 18.0),
                itemCount: _categorias.length,
                itemBuilder: buildItem),
             ),
          ),
        
    );
  }

  Widget buildItem(context, index) {
    return ListTile(
           title: Text(_categorias[index].nome.toString()),
           leading: CircleAvatar(
             // ignore: deprecated_member_use
             child: FlatButton(
                    child: Icon(_categorias[index].icone,
                  ),
                  textColor: Colors.white,
                  onPressed: () {
                    if(_categorias[index].nome == 'Comidas')
                       Navigator.of(context).pushNamed('/comidas', arguments: this.comidaRepository.read());
                  },
                ),
           ),
        );  
     }
  } 