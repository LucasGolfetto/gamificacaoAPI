import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../model/departamento.dart';

class DepartamentoUpdateDataSource {
  final String baseUrl = 'http://10.0.2.2/departamento';

  Future<DepartamentoModel> updateDepartamento(
      {required DepartamentoModel departamento}) async {
    final url = '$baseUrl/${departamento.departamentoId}';
    final response = await http.put(
      Uri.parse(url),
      headers: {'accept': '*/*', 'Content-Type': 'application/json'},
      body: jsonEncode(departamento.toJson()),
    );

    if (response.statusCode == 200) {
      return DepartamentoModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Falha ao atualizar departamento.');
    }
  }
}
