import 'package:aula5/departamento/data/datasources/remote_api/list.dart';
import 'package:aula5/departamento/data/model/departamento.dart';

import 'package:aula5/funcionario/presentation/crud/widgets/botao_gravar.dart';
import 'package:aula5/projeto/data/datasources/remote_api/list.dart';

import 'package:aula5/tarefa/data/datasources/remote_api/insert.dart';
import 'package:aula5/tarefa/data/datasources/remote_api/update.dart';
import 'package:aula5/tarefa/data/model/tarefa.dart';
import 'package:aula5/projeto/data/model/projeto.dart';

import 'package:flutter/material.dart';
import 'widgets/data.dart';
import 'widgets/descricao.dart';
import 'widgets/status.dart';

class TarefaForm extends StatefulWidget {
  final TarefaModel? tarefaModel;

  const TarefaForm({
    Key? key,
    this.tarefaModel,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TarefaPageState createState() => _TarefaPageState();
}

class _TarefaPageState extends State<TarefaForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _descricaoController = TextEditingController();
  final TextEditingController _dataInicioController = TextEditingController();
  final TextEditingController _dataTerminoController = TextEditingController();
  final TextEditingController _statusController = TextEditingController();
  List _departamento = [];
  List<DepartamentoModel> _departamentosCarregados = [];
  List _projeto = [];
  List<ProjetoModel> _projetoCarregados = [];

  @override
  void initState() {
    if (widget.tarefaModel != null) {
      _descricaoController.text = widget.tarefaModel!.descricao;
      _dataInicioController.text = widget.tarefaModel!.dataInicio;
      _dataTerminoController.text = widget.tarefaModel!.dataTermino;
      _statusController.text = widget.tarefaModel!.status;
      _departamento = widget.tarefaModel!.departamento;
      _projeto = widget.tarefaModel!.projeto;
    }

    _carregarDepartamentos();
    _carregarProjetos();

    super.initState();
  }

  Future<void> _salvarDateInicio(formattedDate) async {
    setState(() {
      _dataInicioController.text = formattedDate;
    });
  }

  Future<void> _salvarDateTermino(formattedDate) async {
    setState(() {
      _dataTerminoController.text = formattedDate;
    });
  }

  Future<void> _carregarDepartamentos() async {
    final dados = await DepartamentoListDataSource().getDepartamentos();

    setState(() {
      _departamentosCarregados = dados;
    });
  }

  Future<void> _carregarProjetos() async {
    final dados = await ProjetoListDataSource().getProjetos();

    setState(() {
      _projetoCarregados = dados;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criar Tarefa')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  DescricaoTarefaField(controller: _descricaoController),
                  StatusTarefaField(controller: _statusController),
                  DataTarefaField(
                      dateInput: _dataInicioController,
                      salvarDateInicio: _salvarDateInicio,
                      text: 'Data Inicial'),
                  DataTarefaField(
                      dateInput: _dataTerminoController,
                      salvarDateInicio: _salvarDateTermino,
                      text: 'Data Termino'),
                  const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Selecione os projetos:',
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 18,
                        ),
                      )),
                  SizedBox(
                    height: 150,
                    child: _projetoCarregados.isEmpty
                        ? const Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Nenhum projeto cadastrado',
                                ),
                              ],
                            ),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: _projetoCarregados.length,
                            itemBuilder: (BuildContext context, int index) {
                              final projeto = _projetoCarregados[index];

                              final bool isSelected = _projetoCarregados
                                  .contains(projeto.projetoId);

                              return Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: ListTile(
                                    title: Text(
                                      projeto.descricao,
                                      style: TextStyle(
                                        fontWeight: isSelected
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                        color: isSelected ? Colors.blue : null,
                                      ),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        _projeto[0] = projeto.projetoId;
                                      });
                                    },
                                    tileColor: isSelected
                                        ? Colors.blue.withOpacity(0.5)
                                        : null,
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                  const Divider(
                    color: Color.fromARGB(255, 0, 0, 0),
                    thickness: 1.0,
                  ),
                  const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Selecione os departamentos:',
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 18,
                        ),
                      )),
                  SizedBox(
                    height: 150,
                    child: _projetoCarregados.isEmpty
                        ? const Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Nenhum departamento cadastrado',
                                ),
                              ],
                            ),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: _departamentosCarregados.length,
                            itemBuilder: (BuildContext context, int index) {
                              final departamento =
                                  _departamentosCarregados[index];

                              final bool isSelected = _departamentosCarregados
                                  .contains(departamento.departamentoId);

                              return Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: ListTile(
                                    title: Text(
                                      departamento.descricao,
                                      style: TextStyle(
                                        fontWeight: isSelected
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                        color: isSelected ? Colors.blue : null,
                                      ),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        _departamento[0] =
                                            departamento.departamentoId;
                                      });
                                    },
                                    tileColor: isSelected
                                        ? Colors.blue.withOpacity(0.5)
                                        : null,
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                  const Divider(
                    color: Color.fromARGB(255, 0, 0, 0),
                    thickness: 1.0,
                  ),
                  FuncionarioBotaoGravar(onPressedNovo: () {
                    _descricaoController.clear();
                    _dataInicioController.clear();
                    _dataTerminoController.clear();
                    _statusController.clear();
                  }, onPressed: () async {
                    FocusScope.of(context).unfocus();

                    if (_formKey.currentState!.validate()) {
                      if (widget.tarefaModel == null ||
                          widget.tarefaModel!.tarefaId == null) {
                        await TarefaInsertDataSource().createTarefa(
                          tarefa: TarefaModel(
                              descricao: _descricaoController.text,
                              dataInicio: _dataInicioController.text,
                              dataTermino: _dataTerminoController.text,
                              status: _statusController.text,
                              departamento: _departamento,
                              projeto: _projeto),
                        );
                      } else {
                        await TarefaUpdateDataSource().updateTarefa(
                          tarefa: TarefaModel(
                              tarefaId: widget.tarefaModel!.tarefaId,
                              descricao: _descricaoController.text,
                              dataInicio: _dataInicioController.text,
                              dataTermino: _dataTerminoController.text,
                              status: _statusController.text,
                              departamento: _departamento,
                              projeto: _projeto),
                        );
                      }
                    }
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
