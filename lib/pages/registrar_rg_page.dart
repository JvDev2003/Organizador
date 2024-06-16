import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:organizador/classes/rg_class.dart';
import 'package:organizador/providers/list_item_provider.dart';
import 'package:provider/provider.dart';

class TelaRegistrarRG extends StatefulWidget {
  const TelaRegistrarRG({super.key});

  @override
  State<TelaRegistrarRG> createState() => _TelaRegistrarRGState();
}

class _TelaRegistrarRGState extends State<TelaRegistrarRG> {
  final TextEditingController numeroController = TextEditingController();

  final TextEditingController nomeController = TextEditingController();

  final TextEditingController orgaoController = TextEditingController();

  final TextEditingController dataEmissaoController = TextEditingController();

  final ImagePicker picker = ImagePicker();

  XFile? _imageFile;

  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery); // Use ImageSource.camera para tirar uma foto
      _imageFile = pickedFile;
  }

  Future<void> takeImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera); // Use ImageSource.camera para tirar uma foto
    _imageFile = pickedFile;
  }

  @override
  Widget build(BuildContext context) {
    final listProvider = Provider.of<ListItemProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastre Seu RG"),  
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              TextFormField(
                controller: numeroController,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black, fontSize: 20),
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Número do seu RG',
                  labelStyle: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
              TextFormField(
                controller: nomeController,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black, fontSize: 20),
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  labelText: 'Seu nome no documento',
                  labelStyle: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
              TextFormField(
                controller: orgaoController,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black, fontSize: 20),
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  labelText: 'Orgão emissor do documento',
                  labelStyle: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
              TextFormField(
                controller: dataEmissaoController,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black, fontSize: 20),
                keyboardType: TextInputType.datetime,
                decoration: const InputDecoration(
                  labelText: 'Data da emissão do documento',
                  labelStyle: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
              const Divider(
                color: Colors.white,
              ),
              if (_imageFile != null)
                Image.network(_imageFile!.path),
              TextButton(
                onPressed: pickImage,
                child: const Text('Escolher imagem'),
              ),
              TextButton(
                onPressed: takeImage,
                child: const Text('Tirar uma foto'),
              ),
              const Divider(
                color: Colors.white,
              ),
              FloatingActionButton.extended(
                onPressed: () {
                  if (numeroController.text.isEmpty || nomeController.text.isEmpty || dataEmissaoController.text.isEmpty || orgaoController.text.isEmpty) {
                    const snackBar =  SnackBar(content: Text('Preencha todos os campos!!!'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }else{
                    RG rg = RG(numeroController.text, nomeController.text, dataEmissaoController.text, orgaoController.text, _imageFile);
                    listProvider.insert(rg);
                    Navigator.pushNamed(context, '/principal');
                  }
                }, 
                label: const Text('Salvar'),  
              ),
            ],
          ),
        ),
      ),
    );
  }
}