import 'package:avaliacao_app/app/core/models/client_model.dart';
import 'package:avaliacao_app/app/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UpdateClient extends StatefulWidget {
  final ClientModel model;

  const UpdateClient({Key key, this.model}) : super(key: key);

  @override
  _UpdateClientState createState() => _UpdateClientState();
}

class _UpdateClientState extends State<UpdateClient> {
  final _formKey = GlobalKey<FormState>();
  final HomeController controller = Modular.get<HomeController>();
  @override
  Widget build(BuildContext context) {
    var sizes = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Atualizar Cliente'),
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
                        initialValue: widget.model?.primaryName,
                        onChanged: (value) {
                          widget.model.primaryName = value;
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
                        initialValue: widget.model?.surname,
                        onChanged: (value) => widget.model.surname = value,
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
                        initialValue: widget.model?.phone,
                        onChanged: (value) => widget.model.phone = value,
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
                        initialValue: widget.model?.address,
                        onChanged: (value) => widget.model.address = value,
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
                                'Cliente Atualizado',
                              ),
                            ),
                          );
                        }
                        await controller.updateClient(widget.model);
                      },
                      child: Text('Atualizar'),
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
