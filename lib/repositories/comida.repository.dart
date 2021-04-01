import 'package:lista_compras_app/models/comida.dart';

class ComidaRepository {
    // ignore: deprecated_member_use
    static List<Comida> comidas = List<Comida>();

    create(Comida comida) {
      comidas.add(comida);
    }

    List<Comida> read() {
       comidas.sort((comida1, comida2) {
        if(comida1.finalizado && !comida2.finalizado) return 1;
        else if (!comida1.finalizado && comida2.finalizado) return -1;

        return 0;
      });

      return comidas;
    }
    
    delete(String nome) {
      var comida = comidas.singleWhere((element) => element.nome == nome);
      comidas.remove(comida);
    } 

  
}