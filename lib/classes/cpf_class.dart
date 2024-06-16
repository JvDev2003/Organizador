import 'dart:io';

import 'package:flutter/material.dart';
import 'package:organizador/classes/list_item_class.dart';
import 'package:image_picker/image_picker.dart';
import 'package:organizador/providers/list_item_provider.dart';
import 'package:provider/provider.dart';

class CPF implements ListItem{

  final String numero;
  final String nome;
  final XFile? _imageFile;

  CPF(this.numero, this.nome, [this._imageFile]);
  
  @override
  Widget buildItem(BuildContext context){
  final listProvider = Provider.of<ListItemProvider>(context, listen: false);
  return Card(
  color: Colors.black, 
  child: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      children: [
        const Text("CPF", style: TextStyle(fontSize: 20, color: Colors.white),),
        Text("Numero: $numero", style: const TextStyle(color: Colors.white)),
        Text("Nome: $nome", style: const TextStyle(color: Colors.white)),
        const Divider(
          color: Colors.black,
        ),
        if (_imageFile != null)
        SizedBox(
          child: Image.file(File(_imageFile.path)),
        ),
        const Divider(
          color: Colors.black,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
              onPressed: () => {
                listProvider.delete(this)
              }, 
                icon: const Icon(Icons.cancel_outlined),
                color: Colors.red,
              ),
              IconButton(
                onPressed: () => {
                
                }, 
                icon: const Icon(Icons.edit),
                  color: Colors.blue,
                ),
                IconButton(
                  onPressed: () => {
                    Navigator.pushNamed(context, '/processar')
                  }, 
                  icon: const Icon(Icons.article_outlined),
                  color: Colors.blue,
                ),
            ],
          )
      ],
    ),
  ),
);
  }
}