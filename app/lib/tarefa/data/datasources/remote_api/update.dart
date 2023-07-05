import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../model/tarefa.dart';

class TarefaUpdateDataSource {
  final String baseUrl = 'http://10.0.2.2/tarefa';

  Future<TarefaModel> updateTarefa({required TarefaModel tarefa}) async {
    final url = '$baseUrl/${tarefa.tarefaId}';
    final response = await http.put(
      Uri.parse(url),
      headers: {'accept': '*/*', 'Content-Type': 'application/json'},
      body: jsonEncode(tarefa.toJson()),
    );

    if (response.statusCode == 200) {
      return TarefaModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Falha ao atualizar tarefa.');
    }
  }
}
