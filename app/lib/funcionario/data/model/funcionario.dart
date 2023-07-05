import 'package:aula5/funcionario/domain/entities/funcionario.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../tarefa/data/model/tarefa.dart';

part 'funcionario.g.dart';

@JsonSerializable()
class FuncionarioModel extends FuncionarioEntity {
  final List tarefas;

  FuncionarioModel({
    int? funcionarioId,
    required String nome,
    required String sobrenome,
    required String endereco,
    required String telefone,
    required this.tarefas,
  }) : super(
          funcionarioId: funcionarioId,
          nome: nome,
          sobrenome: sobrenome,
          endereco: endereco,
          telefone: telefone,
        );

  factory FuncionarioModel.fromJson(Map<String, dynamic> json) =>
      _$FuncionarioModelFromJson(json);

  Map<String, dynamic> toJson() => _$FuncionarioModelToJson(this);
}
