import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../model/tarefa.dart';

class TarefaInsertDataSource {
  final String baseUrl = 'http://10.0.2.2/tarefa';

  Future<TarefaModel> createTarefa({required TarefaModel tarefa}) async {
    final response = await http.post(Uri.parse(baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(tarefa.toJson()));

    if (response.statusCode == 201) {
      return TarefaModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Falha ao criar tarefa.');
    }
  }
}
