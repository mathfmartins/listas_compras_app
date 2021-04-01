import 'package:flutter/material.dart';
import 'package:lista_compras_app/models/comida.dart';
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

  Future addProduto(BuildContext context) async {
    if (_categoriaCtrl != null) {
      setState(() {
        this.comidaRepository.create(Comida(nome:  _categoriaCtrl.text, finalizado: false));
      });
    } 

    // var result = await Navigator.of(context).pushNamed('/nova');
    // if (result == true) {
    //   setState(() {
    //     this._categorias = repository.read();
    //   });
    // }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text("Lista de produtos"),
        centerTitle: true,
        actions: [
          // IconButton(icon: Icon(Icons.edit),
          //   onPressed: () => setState(() => canEdit = !canEdit)
          //  ),
        ],
      ),
      body: 
          Align(
            alignment: Alignment(-0.9, 0.0),
            child: Container(
              // padding: EdgeInsets.fromLTRB(0, 1, 1, 1),
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
                  // color: Colors.blueAccent,
                  child: Icon(_categorias[index].icone,),
                  textColor: Colors.white,
                  onPressed: () {
                    if(_categorias[index].nome == 'Comidas')
                       Navigator.of(context).pushNamed('/comidas', arguments: this.comidaRepository.read());
                  },
                ),
            //  child: Icon(_categorias[index].icone,),
           ),
            //  children: [
            //    canEdit ? 
            //      IconButton(icon: Icon(Icons.edit),
            //       onPressed: () => () {},
            //      ) : Container(),
            //  ],
           );    
     }
}