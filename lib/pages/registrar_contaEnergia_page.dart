import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:organizador/classes/contas_class.dart';
import 'package:organizador/providers/list_item_provider.dart';
import 'package:provider/provider.dart';

class TelaRegistrarContaEnergia extends StatefulWidget {
  const TelaRegistrarContaEnergia({super.key});

  @override
  State<TelaRegistrarContaEnergia> createState() => _TelaRegistrarContaEnergiaState();
}

class _TelaRegistrarContaEnergiaState extends State<TelaRegistrarContaEnergia> {
  final TextEditingController numeroController = TextEditingController();

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
        title: const Text("Cadastre sua Conta de Energia"),  
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
                  labelText: 'Digito o número do CEP:',
                  labelStyle: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),

              TextFormField(
                controller: dataEmissaoController,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black, fontSize: 20),
                keyboardType: TextInputType.datetime,
                decoration: const InputDecoration(
                  labelText: 'Qual a data de vencimento da conta:',
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
                  if (numeroController.text.isEmpty || dataEmissaoController.text.isEmpty) {
                    const snackBar =  SnackBar(content: Text('Preencha todos os campos!!!'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }else{
                    Contas conta = Contas(numeroController.text,  dataEmissaoController.text, "Energia", _imageFile);
                    listProvider.insert(conta);
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