import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../model/empresa.dart';

class EmpresaListDataSource {
  final String baseUrl = 'http://10.0.2.2/empresa';

  Future<List<EmpresaModel>> getEmpresas() async {
    final response =
        await http.get(Uri.parse(baseUrl)).timeout(const Duration(seconds: 2));

    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((json) => EmpresaModel.fromJson(json)).toList();
    } else {
      throw Exception('Falha ao carregar empresa.');
    }
  }

  Future<EmpresaModel> getEmpresaById(int id) async {
    final url = '$baseUrl/$id';
    final response =
        await http.get(Uri.parse(url)).timeout(const Duration(seconds: 2));

    if (response.statusCode == 200) {
      return EmpresaModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Falha ao carregar empresa.');
    }
  }
}
