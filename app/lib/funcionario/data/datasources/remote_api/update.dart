import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../model/funcionario.dart';

class FuncionarioUpdateDataSource {
  final String baseUrl = 'http://10.0.2.2/funcionario';

  Future<FuncionarioModel> updateFuncionario(
      {required FuncionarioModel funcionario}) async {
    final url = '$baseUrl/${funcionario.funcionarioId}';
    final response = await http.put(
      Uri.parse(url),
      headers: {'accept': '*/*', 'Content-Type': 'application/json'},
      body: jsonEncode(funcionario.toJson()),
    );

    if (response.statusCode == 200) {
      return FuncionarioModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Falha ao atualizar funcionario.');
    }
  }
}
