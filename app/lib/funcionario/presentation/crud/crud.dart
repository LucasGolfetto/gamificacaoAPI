import 'package:aula5/tarefa/data/datasources/remote_api/list.dart';
import 'package:flutter/material.dart';
import 'package:aula5/funcionario/data/datasources/remote_api/insert.dart';
import 'package:aula5/funcionario/data/datasources/remote_api/update.dart';
import 'package:aula5/funcionario/data/model/funcionario.dart';
import 'package:aula5/funcionario/presentation/crud/widgets/botao_gravar.dart';
import 'package:aula5/funcionario/presentation/crud/widgets/sobrenome.dart';
import 'package:aula5/funcionario/presentation/crud/widgets/telefone.dart';
import 'package:aula5/tarefa/data/model/tarefa.dart';

import 'widgets/endereco.dart';
import 'widgets/nome.dart';

class FuncionarioForm extends StatefulWidget {
  final FuncionarioModel? funcionarioModel;

  const FuncionarioForm({
    Key? key,
    this.funcionarioModel,
  }) : super(key: key);

  @override
  _FuncionarioFormState createState() => _FuncionarioFormState();
}

class _FuncionarioFormState extends State<FuncionarioForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _sobrenomeController = TextEditingController();
  final TextEditingController _enderecoController = TextEditingController();
  final TextEditingController _telefoneController = TextEditingController();
  List _tarefas = [];
  List<TarefaModel> _tarefasCarregadas = [];

  @override
  void initState() {
    if (widget.funcionarioModel != null) {
      _nomeController.text = widget.funcionarioModel!.nome;
      _sobrenomeController.text = widget.funcionarioModel!.sobrenome;
      _enderecoController.text = widget.funcionarioModel!.endereco;
      _telefoneController.text = widget.funcionarioModel!.telefone;
      _tarefas = widget.funcionarioModel!.tarefas;
    }

    _carregarTarefas();

    super.initState();
  }

  Future<void> _carregarTarefas() async {
    final dados = await TarefaListDataSource().getTarefas();

    setState(() {
      _tarefasCarregadas = dados;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criar Funcionario')),
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
                  NomeFuncionarioField(controller: _nomeController),
                  SobrenomeFuncionarioField(controller: _sobrenomeController),
                  EnderecoFuncionarioField(controller: _enderecoController),
                  TelefoneFuncionarioField(controller: _telefoneController),
                  const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Selecione as tarefas:',
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 18,
                        ),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 200,
                    child: _tarefasCarregadas.isEmpty
                        ? const Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Nenhuma tarefa cadastrada',
                                ),
                              ],
                            ),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: _tarefasCarregadas.length,
                            itemBuilder: (BuildContext context, int index) {
                              final TarefaModel tarefa =
                                  _tarefasCarregadas[index];

                              final bool isSelected =
                                  _tarefas.contains(tarefa.tarefaId);

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
                                      tarefa.descricao,
                                      style: TextStyle(
                                        fontWeight: isSelected
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                        color: isSelected ? Colors.blue : null,
                                      ),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        if (isSelected) {
                                          _tarefas.remove(tarefa.tarefaId);
                                        } else {
                                          _tarefas.add(tarefa.tarefaId);
                                        }
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
                  FuncionarioBotaoGravar(
                    onPressedNovo: () {
                      _nomeController.clear();
                      _sobrenomeController.clear();
                      _enderecoController.clear();
                      _telefoneController.clear();
                    },
                    onPressed: () async {
                      FocusScope.of(context).unfocus();

                      if (_formKey.currentState!.validate()) {
                        final FuncionarioModel funcionario = FuncionarioModel(
                          nome: _nomeController.text,
                          sobrenome: _sobrenomeController.text,
                          endereco: _enderecoController.text,
                          telefone: _telefoneController.text,
                          tarefas: _tarefas,
                        );

                        if (widget.funcionarioModel == null ||
                            widget.funcionarioModel!.funcionarioId == null) {
                          await FuncionarioInsertDataSource()
                              .createFuncionario(funcionario: funcionario);
                        } else {
                          funcionario.funcionarioId =
                              widget.funcionarioModel!.funcionarioId;
                          await FuncionarioUpdateDataSource()
                              .updateFuncionario(funcionario: funcionario);
                        }
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
