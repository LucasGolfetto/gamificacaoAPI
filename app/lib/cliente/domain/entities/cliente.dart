class ClienteEntity {
  final int? clienteId;
  final String nome;
  final String sobrenome;
  final String endereco;
  final String telefone;

  const ClienteEntity({
    this.clienteId,
    required this.nome,
    required this.sobrenome,
    required this.endereco,
    required this.telefone,
  });

  String get nomeCompleto => '$nome $sobrenome';
}
