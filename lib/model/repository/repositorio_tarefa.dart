import 'package:todo_app/model/dao/tarefa_dao.dart';
import 'package:todo_app/model/entity/tarefa.dart';

class RepositorioTarefa {
  TarefaDAO dao;
  RepositorioTarefa(this.dao);

  Tarefa cadastrarTarefa(String nome, String descricao, DateTime prazo) {
    return dao.cadastrarTarefa(Tarefa(nome, descricao, prazo));
  }

  List<Tarefa> listarTarefas() {
    return dao.listarTarefas();
  }

  Tarefa toggleFeito(Tarefa tarefa) {
    Tarefa atualizada = dao.marcarFeita(tarefa.id!);
    return atualizada;
  }
}
