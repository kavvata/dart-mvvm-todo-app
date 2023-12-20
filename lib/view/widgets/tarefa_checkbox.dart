import 'package:flutter/material.dart';
import 'package:todo_app/model/entity/tarefa.dart';

class TarefaCheckBox extends StatefulWidget {
  final Tarefa tarefa;
  final Function onFeito;

  const TarefaCheckBox(
      {super.key, required this.tarefa, required this.onFeito});

  @override
  State<StatefulWidget> createState() => _TarefaCheckBoxState();
}

class _TarefaCheckBoxState extends State<TarefaCheckBox> {
  Text geraTitutloTarefa() {
    Text title;
    if (!widget.tarefa.isFeito) {
      title = Text(widget.tarefa.nome);
    } else {
      title = Text.rich(TextSpan(
          text: widget.tarefa.nome,
          style: const TextStyle(
              color: Colors.grey, decoration: TextDecoration.lineThrough)));
    }
    return title;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            value: widget.tarefa.isFeito,
            onChanged: (novoValor) {
              if (novoValor == null) {
                return;
              }
              widget.onFeito.call();
            }),
        geraTitutloTarefa()
      ],
    );
  }
}
