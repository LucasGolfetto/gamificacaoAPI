// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cliente.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClienteModel _$ClienteModelFromJson(Map<String, dynamic> json) => ClienteModel(
      clienteId: json['clienteId'] as int?,
      nome: json['nome'] as String,
      sobrenome: json['sobrenome'] as String,
      endereco: json['endereco'] as String,
      telefone: json['telefone'] as String,
      tarefas: (json['tarefas'] as List<dynamic>)
          .map((e) => TarefaModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ClienteModelToJson(ClienteModel instance) =>
    <String, dynamic>{
      'clienteId': instance.clienteId,
      'nome': instance.nome,
      'sobrenome': instance.sobrenome,
      'endereco': instance.endereco,
      'telefone': instance.telefone,
      'tarefas': instance.tarefas.map((e) => e.toJson()).toList(),
    };
