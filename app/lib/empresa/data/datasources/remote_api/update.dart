import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../model/empresa.dart';

class EmpresaUpdateDataSource {
  final String baseUrl = 'http://10.0.2.2/empresa';

  Future<EmpresaModel> updateEmpresa({required EmpresaModel empresa}) async {
    final url = '$baseUrl/${empresa.empresaId}';
    final response = await http.put(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(empresa.toJson()),
    );

    if (response.statusCode == 200) {
      return EmpresaModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Falha ao atualizar empresa.');
    }
  }
}
