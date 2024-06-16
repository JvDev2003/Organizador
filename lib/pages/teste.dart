import 'package:http/http.dart' as http;  
import 'dart:convert';

Future<List<String>> fetchData() async {
    final response = await http.get(Uri.parse("https://666cb27e49dbc5d7145ee500.mockapi.io/api/processo"));

    if (response.statusCode == 200) {
      // Se o servidor retorna um código de status 200 OK, então parse o JSON.
      var data = jsonDecode(response.body);
      print(data[0]['dados']);
      return data;
    } else {
      // Se a resposta não for OK, lance uma exceção.
      throw Exception('Falha ao carregar dados');
    }
}

void main(List<String> args) {
  fetchData();
}
