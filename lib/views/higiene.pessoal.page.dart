import 'package:flutter/material.dart';
import 'package:lista_compras_app/models/categorias.dart';
import 'package:lista_compras_app/repositories/higiene.repository.dart';

class HigienePessoalPage extends StatefulWidget {
  @override
  _HigienePessoalPageState createState() => _HigienePessoalPageState();
}

class _HigienePessoalPageState extends State<HigienePessoalPage> {

  var _produtoCtrl = TextEditingController(); 
  var repository = HigienePessoalRepository();
  // ignore: deprecated_member_use
  var produtos = List<HigienePessoal>();
  // ignore: deprecated_member_use

  @override
  initState() {
    this.produtos = repository.read();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
  // List<HigienePessoal> produtos = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Higiene Pessoal'),
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
                      fillColor: Colors.purple,
                      labelStyle: TextStyle(color: Colors.purple),
                    ),
                    controller: _produtoCtrl,
                  ),
                ),
               // ignore: deprecated_member_use
               RaisedButton(
                 color: Colors.purple,
                 textColor: Colors.white,
                 child: Text('ADD'),
                 onPressed: () {
                   setState(() {
                      this.repository.create(HigienePessoal(nome: _produtoCtrl.text, finalizado: false, quantidade: 1));
                      this.produtos = repository.read();
                      _produtoCtrl.text = ''; 
                   });
                 }
               ),
              ],
            )
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 18.0),
              itemCount: this.produtos.length,
              itemBuilder: buildItem,
            ),
           ),
        ],
      )
    );
  }

  Widget buildItem(context, index) {
  return Dismissible(
    key: Key(this.produtos[index].nome),
    background: Container(
      color: Colors.red,
      child: Align(
        alignment: Alignment(-0.9, 0.0),
        child: Icon(Icons.delete, color: Colors.white,)
      ),
    ),
    onDismissed: (_) { 
      this.repository.delete(this.produtos[index].nome);
      setState(() {
        this.produtos = repository.read();       
      });
    },
    direction: DismissDirection.startToEnd,
    child: CheckboxListTile(
       value: this.produtos[index].finalizado, 
       title: Row(
         children: [
          Expanded(child: Text(this.produtos[index].nome)),
          Expanded(child: Text(this.produtos[index].quantidade.toString())),
          IconButton(
              icon: const Icon(Icons.remove_circle_outline, color: Colors.red,),
              tooltip: 'Quantidade',
              onPressed: () {
                setState(() {
                  if (this.produtos[index].quantidade == 1) {
                    this.repository.delete(this.produtos[index].nome);
                  }
                  else this.produtos[index].quantidade--;
                });
              },
          ),
          IconButton(
              icon: const Icon(Icons.add, color: Colors.green,),
              tooltip: 'Quantidade',
              onPressed: () {
                setState(() {
                  this.produtos[index].quantidade++;
                });
              },
          ),
         ],
       ),
       secondary: CircleAvatar(child: Icon(this.produtos[index].finalizado ? Icons.check : Icons.error)),
       onChanged: (bool value) { 
         setState(() {
            this.produtos[index].finalizado = value;  
            this.produtos = repository.read();       
         });
       },
   ),
  );
}
  
}