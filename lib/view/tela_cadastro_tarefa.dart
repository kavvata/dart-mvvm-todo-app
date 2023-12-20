import 'package:flutter/material.dart';
import 'package:todo_app/view-model/tarefa_view_model.dart';

class TelaCadastroTarefa extends StatefulWidget {
  final String titulo = 'Cadastrar Tarefa';
  final TarefaViewModel viewModel;

  const TelaCadastroTarefa({super.key, required this.viewModel});

  @override
  State<StatefulWidget> createState() => _StateCadastroTarefa();
}

class _StateCadastroTarefa extends State<TelaCadastroTarefa> {
  final _formKey = GlobalKey<FormState>();
  DateTime prazoSelecionado = DateTime.now();

  final Map<String, TextEditingController> controllers = {};

  @override
  void initState() {
    super.initState();

    controllers.addAll({
      'nome': TextEditingController(),
      'prazo': TextEditingController(),
      'descricao': TextEditingController(),
    });

    var tarefaParaEditar = widget.viewModel.selecionada;

    if (tarefaParaEditar == null) {
      return;
    }

    controllers['nome']!.text = tarefaParaEditar.nome;
    controllers['prazo']!.text =
        '${prazoSelecionado.day}/${prazoSelecionado.month}/${prazoSelecionado.year}';

    prazoSelecionado = tarefaParaEditar.prazo;
    controllers['descricao']!.text = tarefaParaEditar.descricao;
  }

  void _cadastrarTarefa() {
    final isValido = _formKey.currentState?.validate();

    if (isValido == null || !isValido) {
      return;
    }

    final nome = controllers['nome']!.text;
    final descricao = controllers['descricao']!.text;

    widget.viewModel.cadastrarTarefa(nome, descricao, prazoSelecionado);
    _formKey.currentState?.save();
  }

  void _selecionaData() async {
    prazoSelecionado = await showDatePicker(
            context: context,
            firstDate: DateTime.fromMicrosecondsSinceEpoch(0),
            lastDate: DateTime.parse("2069-01-01")) ??
        DateTime.now();

    String str =
        '${prazoSelecionado.day}/${prazoSelecionado.month}/${prazoSelecionado.year}';
    controllers['prazo']!.text = str;
  }

  /// NOTE: Gera lista de widgets do corpo do formulario.
  /// Contem: TextFields para nome, descricao, prazo e um Botao para cadastrar
  /// O TextField de prazo é apenas para mostrar a data selecionada,
  /// ao receber clique, um DatePicker é aberto.
  List<Widget> geraCorpoFormulario() {
    const double defaultHeight = 75;
    const double defaultWidth = 200;

    List<Widget> body = <Widget>[
      // TODO: por favor me separa em TarefaFormField
      // Nome
      Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: SizedBox(
            height: defaultHeight,
            width: defaultWidth,
            child: TextFormField(
              validator: (value) =>
                  controllers['nome']!.text.isEmpty ? "Nome inválido" : null,
              controller: controllers['nome'],
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Nome da tarefa*'),
            )),
      ),
      // Prazo
      Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: SizedBox(
            height: defaultHeight,
            width: defaultWidth,
            child: TextFormField(
              readOnly: true,
              validator: (value) =>
                  controllers['prazo']!.text.isEmpty ? "Prazo inválido" : null,
              controller: controllers['prazo'],
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Prazo*'),
              onTap: () => _selecionaData(),
            )),
      ),
      // Descrição
      Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: SizedBox(
            height: defaultHeight,
            width: defaultWidth,
            child: TextFormField(
              controller: controllers['descricao'],
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Descrição'),
            )),
      ),
      // Botao Cadastro
      ElevatedButton(
          onPressed: () => _cadastrarTarefa(), child: const Text('Cadastrar'))
    ];
    return body;
  }

  @override
  void dispose() {
    controllers.forEach((key, controller) {
      controller.dispose();
    });
    widget.viewModel.limpaSelecionado();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.titulo),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: geraCorpoFormulario(),
          ),
        ),
      ),
    );
  }
}
