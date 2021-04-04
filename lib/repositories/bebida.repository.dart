import 'package:lista_compras_app/models/categorias.dart';

class BebidaRepository {
    // ignore: deprecated_member_use
    static List<Bebida> produtos = List<Bebida>();

    create(Bebida produto) {
      produtos.add(produto);
    }

    List<Bebida> read() {
       produtos.sort((produto1, produto2) {
        if(produto1.finalizado && !produto2.finalizado) return 1;
        else if (!produto1.finalizado && produto2.finalizado) return -1;

        return 0;
      });

      return produtos;
    }
    
    delete(String nome) {
      var produto = produtos.singleWhere((element) => element.nome == nome);
      produtos.remove(produto);
    } 

  
}