import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../model/cliente.dart';

class ClienteInsertDataSource {
  final String baseUrl = 'http://10.0.2.2/cliente';

  Future<ClienteModel> createCliente({required ClienteModel cliente}) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(cliente.toJson()),
    );

    if (response.statusCode == 201) {
      return ClienteModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Falha ao Criar um Cliente.');
    }
  }
}
