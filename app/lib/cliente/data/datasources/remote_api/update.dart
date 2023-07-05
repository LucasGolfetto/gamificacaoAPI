import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../model/cliente.dart';

class ClienteUpdateDataSource {
  final String baseUrl = 'http://10.0.2.2/cliente';

  Future<ClienteModel> updateCliente({required ClienteModel cliente}) async {
    final url = '$baseUrl/${cliente.clienteId}';
    final response = await http.put(
      Uri.parse(url),
      headers: {'accept': '*/*', 'Content-Type': 'application/json'},
      body: jsonEncode(cliente.toJson()),
    );

    if (response.statusCode == 200) {
      return ClienteModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Falha ao Atualizar Cliente.');
    }
  }
}
