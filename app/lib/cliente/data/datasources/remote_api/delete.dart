import 'package:http/http.dart' as http;

class ClienteDeleteDataSource {
  final String baseUrl = 'http://10.0.2.2/cliente';

  Future<void> deleteCliente(int id) async {
    final url = '$baseUrl/$id';
    final response = await http.delete(Uri.parse(url));

    if (response.statusCode != 200) {
      throw Exception('Falha ao Excluir o Cliente.');
    }
  }
}
