import 'package:flutter/material.dart';
import 'package:todo_app/model/entity/tarefa.dart';

class TarefaCheckBoxTile extends StatefulWidget {
  final Tarefa tarefa;
  final ValueChanged<bool?> onFeito;
  final Function onTitleTap;

  const TarefaCheckBoxTile(
      {super.key,
      required this.tarefa,
      required this.onFeito,
      required this.onTitleTap});

  @override
  State<StatefulWidget> createState() => _TarefaCheckBoxTileState();
}

class _TarefaCheckBoxTileState extends State<TarefaCheckBoxTile> {
  Widget geraTitutloTarefa() {
    // Se tarefa for feita, riscar nome da tarefa!
    Text texto;
    if (!widget.tarefa.isFeito) {
      texto = Text(widget.tarefa.nome);
    } else {
      texto = Text.rich(TextSpan(
          text: widget.tarefa.nome,
          style: const TextStyle(
              color: Colors.grey, decoration: TextDecoration.lineThrough)));
    }
    //
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: texto,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.onTitleTap.call(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Row(
          children: [
            Checkbox(
                value: widget.tarefa.isFeito,
                onChanged: (novoValor) {
                  assert(novoValor != null);
                  widget.onFeito.call(novoValor);
                }),
            geraTitutloTarefa()
          ],
        ),
      ),
    );
  }
}
