import 'package:aula5/departamento/data/model/departamento.dart';
import 'package:aula5/projeto/data/model/projeto.dart';
import 'package:aula5/tarefa/domain/entities/tarefa.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tarefa.g.dart';

@JsonSerializable()
class TarefaModel extends TarefaEntity {
  final List departamento;
  final List projeto;

  const TarefaModel({
    int? tarefaId,
    required String descricao,
    required String dataInicio,
    required String dataTermino,
    required String status,
    required this.departamento,
    required this.projeto,
  }) : super(
          tarefaId: tarefaId,
          descricao: descricao,
          dataInicio: dataInicio,
          dataTermino: dataTermino,
          status: status,
        );

  factory TarefaModel.fromJson(Map<String, dynamic> json) =>
      _$TarefaModelFromJson(json);

  Map<String, dynamic> toJson() => _$TarefaModelToJson(this);
}
