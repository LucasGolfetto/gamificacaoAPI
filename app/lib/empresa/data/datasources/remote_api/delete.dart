import 'package:http/http.dart' as http;

class EmpresaDeleteDataSource {
  final String baseUrl = 'http://10.0.2.2/empresa';

  Future<void> deleteEmpresa(int id) async {
    final url = '$baseUrl/$id';
    final response = await http.delete(Uri.parse(url));

    if (response.statusCode != 200) {
      throw Exception('Falha ao excluir empresa.');
    }
  }
}
