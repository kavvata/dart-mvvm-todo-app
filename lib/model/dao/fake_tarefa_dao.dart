import 'package:todo_app/model/dao/tarefa_dao.dart';
import 'package:todo_app/model/entity/tarefa.dart';

class FakeTarefaDAO implements TarefaDAO {
  List<Tarefa> lista = <Tarefa>[];
  int lastId = 0;

  FakeTarefaDAO() {
    cadastrarTarefa(Tarefa("Lavar", "", DateTime.parse("2023-12-13")));
    cadastrarTarefa(Tarefa("Passar", "", DateTime.parse("2023-12-13")));
    cadastrarTarefa(Tarefa("Dobrar", "", DateTime.parse("2023-12-13")));
  }
  @override
  Tarefa cadastrarTarefa(Tarefa nova) {
    lastId += 1;
    nova.id = lastId;
    lista.add(nova);

    return nova;
  }

  @override
  List<Tarefa> listarTarefas() {
    return lista.toList();
  }

  @override
  bool removerTarefa(int id) {
    Tarefa t;
    try {
      t = lista.elementAt(id - 1);
    } catch (error) {
      return false;
    }
    lista.remove(t);
    return true;
  }

  @override
  Tarefa marcarFeita(int id) {
    Tarefa t;
    try {
      t = lista.elementAt(id - 1);
    } catch (error) {
      throw Exception('DAO: tarefa $id nao encontrada');
    }

    t.toggleFeito();

    print("=============");
    lista.forEach((element) => print(element.toString()));
    print("=============");

    return Tarefa.fromDAO(id, t.nome, t.descricao, t.prazo, t.feito);
  }
}
