class Tarefa {
  int? id;
  String nome;
  String descricao;
  DateTime prazo;
  bool feito = false;

  Tarefa(this.nome, this.descricao, this.prazo);
  Tarefa.fromDAO(this.id, this.nome, this.descricao, this.prazo, this.feito);

  void toggleFeito() => feito = !feito;

  @override
  String toString() {
    var estado = feito ? "[X]" : "[ ]";

    return "$estado - $nome | Prazo: $prazo";
  }
}
