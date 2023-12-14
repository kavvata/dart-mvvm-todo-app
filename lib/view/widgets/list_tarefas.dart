import 'package:flutter/material.dart';
import 'package:todo_app/model/entity/tarefa.dart';
import 'package:todo_app/view-model/tarefa_view_model.dart';

class ListTarefas extends StatefulWidget {
  final TarefaViewModel viewModel;
  const ListTarefas({super.key, required this.viewModel});

  @override
  State<StatefulWidget> createState() => _ListTarefaState();
}

class _ListTarefaState extends State<ListTarefas> {
  Text geraTitulo(Tarefa tarefa) {
    Text title;
    if (!tarefa.feito) {
      title = Text(tarefa.nome);
    } else {
      title = Text.rich(TextSpan(
          text: tarefa.nome,
          style: const TextStyle(
              color: Colors.grey, decoration: TextDecoration.lineThrough)));
    }
    return title;
  }

  Widget geraListaTarefas() {
    widget.viewModel.fetchListaTarefas();

    final builder = ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, child) {
        List<Widget> tiles = <Widget>[];

        for (var tarefa in widget.viewModel.tarefas) {
          var builder = ListenableBuilder(
              listenable: widget.viewModel,
              builder: (context, child) => CheckboxListTile(
                    title: geraTitulo(tarefa),
                    value: tarefa.feito,
                    onChanged: (novoValor) =>
                        widget.viewModel.toggleFeito(tarefa),
                    controlAffinity: ListTileControlAffinity.leading,
                  ));

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
      child: geraListaTarefas(),
    );
  }
}
