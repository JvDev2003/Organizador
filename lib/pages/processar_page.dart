import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class TelaFotoProcessada extends StatefulWidget {
  const TelaFotoProcessada({super.key});

  @override
  State<TelaFotoProcessada> createState() => _TelaFotoProcessadaState();
}

class _TelaFotoProcessadaState extends State<TelaFotoProcessada> {

  late Future<List<dynamic>> futureDados;

  Future<List<dynamic>> fetchData() async {
    final response = await http.get(Uri.parse("https://666cb27e49dbc5d7145ee500.mockapi.io/api/processo"));

    if (response.statusCode == 200) {
      // Se o servidor retorna um código de status 200 OK, então parse o JSON.
      var data = jsonDecode(response.body);

      return data[0]['dados'];
    } else {
      // Se a resposta não for OK, lance uma exceção.
      throw Exception('Falha ao carregar dados');
    }
  }

  @override
  void initState() {
    super.initState();
    futureDados = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dados Foto"),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder(
          future: futureDados, 
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Clipboard.setData(ClipboardData(text: snapshot.data?[index]));

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Texto copiado para a área de transferência!')),
                      );
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(snapshot.data!.elementAt(index)),
                      ) 

                      
                    )
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }

            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
