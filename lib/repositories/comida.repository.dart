import 'package:lista_compras_app/models/categorias.dart';

class ComidaRepository {
    // ignore: deprecated_member_use
    static List<Comida> produtos = List<Comida>();

    create(Comida produto) {
      produtos.add(produto);
    }

    List<Comida> read() {
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