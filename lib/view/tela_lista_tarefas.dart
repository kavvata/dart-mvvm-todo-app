import 'package:flutter/material.dart';
import 'package:todo_app/view-model/tarefa_view_model.dart';
import 'package:todo_app/view/tela_cadastro_tarefa.dart';
import 'package:todo_app/view/widgets/drawer.dart';
import 'package:todo_app/view/widgets/list_tarefas.dart';

class TelaListaTarefas extends StatefulWidget {
  final TarefaViewModel viewModel;
  final String titulo = 'Listar Tarefas';
  const TelaListaTarefas({super.key, required this.viewModel});

  @override
  State<StatefulWidget> createState() => _TelaListaTarefasState();
}

class _TelaListaTarefasState extends State<TelaListaTarefas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.titulo),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      drawer: geraDrawer(context),
      body: ListTarefas(viewModel: widget.viewModel),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TelaCadastroTarefa(
                      viewModel: widget.viewModel,
                    ))),
        child: const Icon(Icons.add),
      ),
    );
  }
}
