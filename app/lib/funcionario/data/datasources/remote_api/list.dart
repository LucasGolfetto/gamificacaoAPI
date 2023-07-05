import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../model/funcionario.dart';

class FuncionarioListDataSource {
  final String baseUrl = 'http://10.0.2.2/funcionario';

  Future<List<FuncionarioModel>> getFuncionarios() async {
    final response =
        await http.get(Uri.parse(baseUrl)).timeout(const Duration(seconds: 2));

    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse
          .map((json) => FuncionarioModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Falha ao carregar funcionarios.');
    }
  }

  Future<FuncionarioModel> getFucionarioById(int id) async {
    final url = '$baseUrl/$id';
    final response =
        await http.get(Uri.parse(url)).timeout(const Duration(seconds: 2));

    if (response.statusCode == 200) {
      return FuncionarioModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Falha ao carregar funcionarios.');
    }
  }
}
