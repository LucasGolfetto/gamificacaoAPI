class ProjetoEntity {
  final int? projetoId;
  final String nome;
  final String descricao;
  final String dataInicio;
  final String dataTermino;

  ProjetoEntity(
      {this.projetoId,
      required this.nome,
      required this.descricao,
      required this.dataInicio,
      required this.dataTermino});
}
