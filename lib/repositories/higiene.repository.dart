
import 'package:lista_compras_app/models/categorias.dart';

class HigienePessoalRepository {
    // ignore: deprecated_member_use
    static List<HigienePessoal> produtos = List<HigienePessoal>();

    create(HigienePessoal produto) {
      produtos.add(produto);
    }

    List<HigienePessoal> read() {
       produtos.sort((comida1, comida2) {
        if(comida1.finalizado && !comida2.finalizado) return 1;
        else if (!comida1.finalizado && comida2.finalizado) return -1;

        return 0;
      });

      return produtos;
    }
    
    delete(String nome) {
      var produto = produtos.singleWhere((element) => element.nome == nome);
      produtos.remove(produto);
    } 

  
}