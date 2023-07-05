import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../model/tarefa.dart';

class TarefaListDataSource {
  final String baseUrl = 'http://10.0.2.2/tarefa';

  Future<List<TarefaModel>> getTarefas() async {
    final response =
        await http.get(Uri.parse(baseUrl)).timeout(const Duration(seconds: 2));

    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((json) => TarefaModel.fromJson(json)).toList();
    } else {
      return [];
    }
  }

  Future<TarefaModel> getTarefaById(int id) async {
    final url = '$baseUrl/$id';
    final response =
        await http.get(Uri.parse(url)).timeout(const Duration(seconds: 2));

    if (response.statusCode == 200) {
      return TarefaModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Falha ao carregar tarefa.');
    }
  }
}
