import 'package:flutter/material.dart';
import 'package:todo_app/model/entity/tarefa.dart';
import 'package:todo_app/view-model/tarefa_view_model.dart';
import 'package:todo_app/view/widgets/tarefa_checkbox_tile.dart';

class ListTarefas extends StatefulWidget {
  final TarefaViewModel viewModel;
  const ListTarefas({super.key, required this.viewModel});

  @override
  State<StatefulWidget> createState() => _ListTarefaState();
}

class _ListTarefaState extends State<ListTarefas> {
  Widget _geraListaTarefas() {
    widget.viewModel.fetchListaTarefas();

    final builder = ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, child) {
        List<Widget> tiles = <Widget>[];

        for (var tarefa in widget.viewModel.tarefas) {
          var builder = ListenableBuilder(
              listenable: widget.viewModel,
              builder: (context, child) => TarefaCheckBoxTile(
                  tarefa: tarefa,
                  onTitleTap: () {
                    widget.viewModel.selecionaTarefa(tarefa);
                    Navigator.pushNamed(context, 'cadastro');
                  },
                  onFeito: (novoValor) =>
                      widget.viewModel.toggleFeito(tarefa)));

          tiles.add(builder);
        }
        return ListView(children: tiles);
      },
    );

    return builder;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _geraListaTarefas(),
    );
  }
}
