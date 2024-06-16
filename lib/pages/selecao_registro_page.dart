import 'package:flutter/material.dart';

class TelaSelecaoRegistro extends StatelessWidget {
  TelaSelecaoRegistro({super.key});

  final List<String> options = ['CPF', 'RG', 'Conta de Energia', 'Conta de Água', 'outros'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Escolha o Tipo de Documento"),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: options.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(options[index]),
              onTap: () {
                String path = options[index].toLowerCase().replaceAll(' ', '');
                Navigator.pushNamed(context, '/registrar/$path');
              },
            );
          },
        ),
      ),
    );
  }
}