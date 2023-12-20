class Tarefa {
  int? id;
  String nome;
  String descricao;
  DateTime prazo;
  bool feito = false;

  Tarefa(this.nome, this.descricao, this.prazo);
  Tarefa.fromDAO(this.id, this.nome, this.descricao, this.prazo, this.feito);

  void toggleFeito() => feito = !feito;
  bool get isFeito => feito;

  @override
  String toString() {
    var estado = feito ? "[X]" : "[ ]";

    return "$id - $estado $nome | Prazo: $prazo";
  }
}
