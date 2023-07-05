import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../model/empresa.dart';

class EmpresaInsertDataSource {
  final String baseUrl = 'http://10.0.2.2/empresa';

  Future<EmpresaModel> createEmpresa({required EmpresaModel empresa}) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(empresa.toJson()),
    );

    if (response.statusCode == 201) {
      return EmpresaModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Falha ao criar empresa.');
    }
  }
}
