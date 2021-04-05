import 'package:flutter/material.dart';
import 'package:lista_compras_app/models/categorias.dart';
import 'package:lista_compras_app/repositories/bebida.repository.dart';

class BebidasPage extends StatefulWidget {
  @override
  _BebidasPageState createState() => _BebidasPageState();
}

class _BebidasPageState extends State<BebidasPage> {

  var _bebidaCtrl = TextEditingController(); 
  var repository = BebidaRepository();
  // ignore: deprecated_member_use
  var bebidas = List<Bebida>();
  // ignore: deprecated_member_use

  @override
  initState() {
    this.bebidas = repository.read();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
  // List<Comida> bebidas = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Bebidas'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(17, 1, 1, 1),
            child: Row(
              children: [
                Expanded(
                  child:  
                    TextField(
                      decoration: InputDecoration(
                      labelText: 'Descrição',
                      labelStyle: TextStyle(color: Colors.purple),
                    ),
                    controller: _bebidaCtrl,
                  ),
                ),
               // ignore: deprecated_member_use
               RaisedButton(
                 color: Colors.purple,
                 textColor: Colors.white,
                 child: Text('ADD'),
                 onPressed: () {
                   setState(() {
                      this.repository.create(Bebida(nome: _bebidaCtrl.text, finalizado: false, quantidade: 1));
                      this.bebidas = repository.read();
                      _bebidaCtrl.text = '';
                   });
                 }
               ),
              ],
            )
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 18.0),
              itemCount: this.bebidas.length,
              itemBuilder: buildItem,
            ),
           ),
        ],
      )
    );
  }

  Widget buildItem(context, index) {
  return Dismissible(
    key: Key(this.bebidas[index].nome),
    background: Container(
      color: Colors.red,
      child: Align(
        alignment: Alignment(-0.9, 0.0),
        child: Icon(Icons.delete, color: Colors.white,)
      ),
    ),
    onDismissed: (_) { 
      this.repository.delete(this.bebidas[index].nome);
      setState(() {
        this.bebidas = repository.read();       
      });
    },
    direction: DismissDirection.startToEnd,
    child: CheckboxListTile(
       secondary: CircleAvatar(child: Icon(this.bebidas[index].finalizado ? Icons.check : Icons.error)),
       value: this.bebidas[index].finalizado, 
       title: Row(
         children: [
          Expanded(child: Text(this.bebidas[index].nome, style: TextStyle(fontWeight: FontWeight.w600),)),
          Expanded(child: Text(this.bebidas[index].quantidade.toString(), style: TextStyle(fontWeight: FontWeight.w600))),
          IconButton(
              icon: const Icon(Icons.remove_circle_outline, color: Colors.red),
              tooltip: 'Quantidade',
              onPressed: () {
                setState(() {
                  if (this.bebidas[index].quantidade == 1) {
                     this.repository.delete(this.bebidas[index].nome);
                  }
                  else this.bebidas[index].quantidade--;
                });
              },
          ),
          IconButton(
              icon: const Icon(Icons.add, color: Colors.green),
              tooltip: 'Quantidade',
              onPressed: () {
                setState(() {
                  this.bebidas[index].quantidade++;
                });
              },
          ),
         ],
       ),
       onChanged: (bool value) { 
         setState(() {
            this.bebidas[index].finalizado = value;  
            this.bebidas = repository.read();       
         });
       },
   ),
  );
}
  
}