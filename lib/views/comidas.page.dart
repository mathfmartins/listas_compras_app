import 'package:flutter/material.dart';
import 'package:lista_compras_app/models/categorias.dart';
import 'package:lista_compras_app/repositories/comida.repository.dart';

class ComidasPage extends StatefulWidget {
  @override
  _ComidaPageState createState() => _ComidaPageState();
}

class _ComidaPageState extends State<ComidasPage> {

  var _comidaCtrl = TextEditingController(); 
  var repository = ComidaRepository();
  // ignore: deprecated_member_use
  var comidas = List<Comida>();
  // ignore: deprecated_member_use

  @override
  initState() {
    this.comidas = repository.read();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
  // List<Comida> comidas = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Comidas'),
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
                    controller: _comidaCtrl,
                  ),
                ),
               // ignore: deprecated_member_use
               RaisedButton(
                 color: Colors.purple,
                 textColor: Colors.white,
                 child: Text('ADD'),
                 onPressed: () {
                   setState(() {
                      this.repository.create(Comida(nome: _comidaCtrl.text, finalizado: false, quantidade: 1));
                      this.comidas = repository.read();
                      _comidaCtrl.text = '';
                   });
                 }
               ),
              ],
            )
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 18.0),
              itemCount: this.comidas.length,
              itemBuilder: buildItem,
            ),
           ),
        ],
      )
    );
  }

  Widget buildItem(context, index) {
  return Dismissible(
    key: Key(this.comidas[index].nome),
    background: Container(
      color: Colors.red,
      child: Align(
        alignment: Alignment(-0.9, 0.0),
        child: Icon(Icons.delete, color: Colors.white,)
      ),
    ),
    onDismissed: (_) { 
      this.repository.delete(this.comidas[index].nome);
      setState(() {
        this.comidas = repository.read();       
      });
    },
    direction: DismissDirection.startToEnd,
    child: CheckboxListTile(
       secondary: CircleAvatar(child: Icon(this.comidas[index].finalizado ? Icons.check : Icons.error)),
       value: this.comidas[index].finalizado, 
       title: Row(
         children: [
          Expanded(child: Text(this.comidas[index].nome, style: TextStyle(fontWeight: FontWeight.w600)),),
          Expanded(child: Text(this.comidas[index].quantidade.toString(), style: TextStyle(fontWeight: FontWeight.w600),)),
          IconButton(
              icon: const Icon(Icons.remove_circle_outline, color: Colors.red),
              tooltip: 'Quantidade',
              onPressed: () {
                setState(() {
                  if (this.comidas[index].quantidade == 1) {
                    this.repository.delete(this.comidas[index].nome);
                  }
                  else this.comidas[index].quantidade--;
                });
              },
          ),
          IconButton(
              icon: const Icon(Icons.add, color: Colors.green,),
              tooltip: 'Quantidade',
              onPressed: () {
                setState(() {
                  this.comidas[index].quantidade++;
                });
              },
          ),
         ],
       ),
       onChanged: (bool value) { 
         setState(() {
            this.comidas[index].finalizado = value;  
            this.comidas = repository.read();       
         });
       },
   ),
  );
}
  
}