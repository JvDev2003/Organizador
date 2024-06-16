import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:organizador/classes/list_item_class.dart';
import 'package:organizador/providers/list_item_provider.dart';
import 'package:provider/provider.dart';

class RG implements ListItem{

  final String numero;
  final String nome;
  final String orgaoEmissor;
  final String dataEmissao;
  final XFile? _imageFile;

  RG(this.numero, this.nome, this.dataEmissao, this.orgaoEmissor, [this._imageFile]);

  @override
  Widget buildItem(BuildContext context){
    final listProvider = Provider.of<ListItemProvider>(context, listen: false);
    return Card(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(16.0), // ajuste o valor conforme necessário
        child: Column(
          children: [
            const Text("RG", style: TextStyle(fontSize: 20, color: Colors.white)),
            Text("Numero: $numero", style: const TextStyle(color: Colors.white)),
            Text("Nome: $nome", style: const TextStyle(color: Colors.white)),
            Text("Orgão Emissor: $orgaoEmissor", style: const TextStyle(color: Colors.white)),
            Text("Data de Emissão: $dataEmissao", style: const TextStyle(color: Colors.white)),
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