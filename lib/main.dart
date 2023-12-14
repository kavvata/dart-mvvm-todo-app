import 'package:flutter/material.dart';
import 'package:todo_app/model/dao/fake_tarefa_dao.dart';
import 'package:todo_app/model/repository/repositorio_tarefa.dart';
import 'package:todo_app/view-model/tarefa_view_model.dart';
import 'package:todo_app/view/tela_lista_tarefas.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var dao = FakeTarefaDAO();
    var repo = RepositorioTarefa(dao);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: TelaListaTarefas(viewModel: TarefaViewModel(repo)),
    );
  }
}
