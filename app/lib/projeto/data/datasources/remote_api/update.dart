import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../model/projeto.dart';

class ProjetoUpdateDataSource {
  final String baseUrl = 'http://10.0.2.2/projeto';

  Future<ProjetoModel> updateProjeto({required ProjetoModel projeto}) async {
    final url = '$baseUrl/${projeto.projetoId}';
    final response = await http.put(
      Uri.parse(url),
      headers: {'accept': '*/*', 'Content-Type': 'application/json'},
      body: jsonEncode(projeto.toJson()),
    );

    if (response.statusCode == 200) {
      return ProjetoModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Falha ao atualizar projeto.');
    }
  }
}
