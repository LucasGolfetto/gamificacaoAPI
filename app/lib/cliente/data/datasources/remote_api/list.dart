import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../model/cliente.dart';

class ClienteListDataSource {
  final String baseUrl = 'http://10.0.2.2/cliente';

  Future<List<ClienteModel>> getClientes() async {
    final response =
        await http.get(Uri.parse(baseUrl)).timeout(const Duration(seconds: 2));

    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((json) => ClienteModel.fromJson(json)).toList();
    } else {
      throw Exception('Falha ao Carregar os Clientes Salvos.');
    }
  }

  Future<ClienteModel> getClienteById(int id) async {
    final url = '$baseUrl/$id';
    final response =
        await http.get(Uri.parse(url)).timeout(const Duration(seconds: 2));

    if (response.statusCode == 200) {
      return ClienteModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Falha ao Carregar o Cliente.');
    }
  }
}
