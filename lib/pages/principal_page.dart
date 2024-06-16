import 'package:flutter/material.dart';
import 'package:organizador/classes/list_item_class.dart';
import 'package:organizador/providers/list_item_provider.dart';
import 'package:provider/provider.dart';
class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
Widget build(BuildContext context) {
    final listProvider = Provider.of<ListItemProvider>(context, listen: true);
    List<ListItem> list = listProvider.getAll(); 
    return Scaffold(
      appBar: AppBar(
        title: const Text("Organizador de Documentos"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child:
              ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return list[index].buildItem(context);
                },
              ),
        ),
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomRight,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/selecaoRegistro');
          },
          backgroundColor: Colors.blue,
          child: const Icon(Icons.add),
        ),
      ),
    );

  }
}