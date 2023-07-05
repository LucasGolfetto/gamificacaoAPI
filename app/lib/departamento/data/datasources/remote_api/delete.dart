//import 'dart:convert';
import 'package:http/http.dart' as http;
//import '../../model/departamento.dart';

class DepartamentoDeleteDataSource {
  final String baseUrl = 'http://10.0.2.2/departamento';

  Future<void> deleteDepartamento(int id) async {
    final url = '$baseUrl/$id';
    final response = await http.delete(Uri.parse(url));

    if (response.statusCode != 200) {
      throw Exception('Falha ao excluir departamento.');
    }
  }
}
