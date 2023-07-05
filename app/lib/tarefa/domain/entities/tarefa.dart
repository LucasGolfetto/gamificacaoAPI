class TarefaEntity {
  final int? tarefaId;
  final String descricao;
  final String dataInicio;
  final String dataTermino;
  final String status;

  const TarefaEntity({
    this.tarefaId,
    required this.descricao,
    required this.dataInicio,
    required this.dataTermino,
    required this.status,
  });
}
