import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../model/funcionario.dart';

class FuncionarioInsertDataSource {
  final String baseUrl = 'http://10.0.2.2/funcionario';

  Future<FuncionarioModel> createFuncionario(
      {required FuncionarioModel funcionario}) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(funcionario.toJson()),
    );

    if (response.statusCode == 201) {
      return FuncionarioModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Falha ao criar funcionario.');
    }
  }
}
