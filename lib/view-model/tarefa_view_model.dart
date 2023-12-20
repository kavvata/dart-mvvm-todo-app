import 'package:flutter/material.dart';
import 'package:todo_app/model/entity/tarefa.dart';
import 'package:todo_app/model/repository/repositorio_tarefa.dart';

class TarefaViewModel with ChangeNotifier {
  List<Tarefa> _tarefasCache = <Tarefa>[];
  RepositorioTarefa repo;
  Tarefa? selecionada;

  List<Tarefa> get tarefas => _tarefasCache;

  TarefaViewModel(this.repo);

  void cadastrarTarefa(String nome, String descricao, DateTime prazo) {
    _tarefasCache.add(repo.cadastrarTarefa(nome, descricao, prazo));
    notifyListeners();
  }

  void selecionaTarefa(Tarefa t) {
    selecionada = t;
  }

  void limpaSelecionado() {
    selecionada = null;
  }

  void fetchListaTarefas() {
    _tarefasCache = repo.listarTarefas();
    notifyListeners();
  }

  void toggleFeito(Tarefa tarefa) {
    tarefa = repo.toggleFeito(tarefa);
    notifyListeners();
  }
}
