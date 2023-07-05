class EmpresaEntity {
  final int? empresaId;
  final String nome;
  final String endereco;
  final String telefone;

  const EmpresaEntity({
    this.empresaId,
    required this.nome,
    required this.endereco,
    required this.telefone,
  });

  String get nomeCompleto => '$nome ';
}
