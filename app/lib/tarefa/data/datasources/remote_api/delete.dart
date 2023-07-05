import 'package:http/http.dart' as http;

class TarefaDeleteDataSource {
  final String baseUrl = 'http://10.0.2.2/tarefa';

  Future<void> deleteTarefa(int id) async {
    final url = '$baseUrl/$id';
    final response = await http.delete(Uri.parse(url));

    if (response.statusCode != 200) {
      throw Exception('Falha ao excluir tarefa.');
    }
  }
}
