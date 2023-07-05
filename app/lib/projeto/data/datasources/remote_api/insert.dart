import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../model/projeto.dart';

class ProjetoInsertDataSource {
  final String baseUrl = 'http://10.0.2.2/projeto';

  Future<ProjetoModel> createProjeto({required ProjetoModel projeto}) async {
    final response = await http.post(Uri.parse(baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(projeto.toJson()));

    if (response.statusCode == 201) {
      return ProjetoModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Falha ao criar projeto.');
    }
  }
}
