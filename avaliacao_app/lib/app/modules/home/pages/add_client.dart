import 'package:avaliacao_app/app/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AddClient extends StatefulWidget {
  @override
  _AddClientState createState() => _AddClientState();
}

class _AddClientState extends State<AddClient> {
  final _formKey = GlobalKey<FormState>();
  final HomeController controller = Modular.get<HomeController>();
  @override
  Widget build(BuildContext context) {
    var sizes = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Clientes'),
        centerTitle: true,
      ),
      body: Builder(
        builder: (BuildContext context) {
          return Form(
            key: _formKey,
            child: Container(
              height: sizes.height,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Campo Obrigatorio';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          controller.model.primaryName = value;
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), labelText: 'Nome'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Campo Obrigatorio';
                          }
                          return null;
                        },
                        onChanged: (value) => controller.model.surname = value,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Sobrenome'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Campo Obrigatorio';
                          }
                          return null;
                        },
                        onChanged: (value) => controller.model.phone = value,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Telefone'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Campo Obrigatorio';
                          }
                          return null;
                        },
                        onChanged: (value) => controller.model.address = value,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Endereço'),
                      ),
                    ),
                    RaisedButton(
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          Scaffold.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Salvando Cliente',
                              ),
                            ),
                          );
                        }

                        await controller.insertClient();
                      },
                      child: Text('Salvar'),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
