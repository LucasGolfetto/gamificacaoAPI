import 'package:http/http.dart' as http;

class FuncionarioDeleteDataSource {
  final String baseUrl = 'http://10.0.2.2/funcionario';

  Future<void> deleteFuncionario(int id) async {
    final url = '$baseUrl/$id';
    final response = await http.delete(Uri.parse(url));

    if (response.statusCode != 200) {
      throw Exception('Falha ao excluir funcionario.');
    }
  }
}
