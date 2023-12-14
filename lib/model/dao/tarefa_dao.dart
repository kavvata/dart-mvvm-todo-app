import 'package:todo_app/model/entity/tarefa.dart';

abstract class TarefaDAO {
  Tarefa cadastrarTarefa(Tarefa nova);
  List<Tarefa> listarTarefas();
  bool removerTarefa(int id);
  Tarefa marcarFeita(int id);
}
