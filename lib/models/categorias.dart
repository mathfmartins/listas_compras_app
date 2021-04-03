abstract class Produto {
  String nome;
  bool finalizado;
  int quantidade;
  // Produto({this.nome, this.finalizado, this.quantidade: 1});
  
}

class Comida implements Produto {
  @override
  bool finalizado;

  @override
  String nome;

  @override
  int quantidade;

  Comida({this.nome, this.finalizado, this.quantidade: 1});

}

class Bebida implements Produto {
  @override
  bool finalizado;

  @override
  String nome;

  @override
  int quantidade;

  Bebida({this.nome, this.finalizado, this.quantidade: 1});

}

class HigienePessoal implements Produto {
  @override
  bool finalizado;

  @override
  String nome;

  @override
  int quantidade;

  HigienePessoal({this.nome, this.finalizado, this.quantidade: 1});

}

class Frios implements Produto {
  @override
  bool finalizado;

  @override
  String nome;

  @override
  int quantidade;

  Frios({this.nome, this.finalizado, this.quantidade: 1});

}

