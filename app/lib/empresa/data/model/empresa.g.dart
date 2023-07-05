// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'empresa.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmpresaModel _$EmpresaModelFromJson(Map<String, dynamic> json) => EmpresaModel(
      empresaId: json['empresaId'] as int?,
      nome: json['nome'] as String,
      endereco: json['endereco'] as String,
      telefone: json['telefone'] as String,
    );

Map<String, dynamic> _$EmpresaModelToJson(EmpresaModel instance) =>
    <String, dynamic>{
      'empresaId': instance.empresaId,
      'nome': instance.nome,
      'endereco': instance.endereco,
      'telefone': instance.telefone,
    };
