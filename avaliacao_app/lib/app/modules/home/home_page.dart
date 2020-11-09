import 'package:avaliacao_app/app/core/models/client_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Todos os Clientes"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  final scrollController = ScrollController();
  bool stateButton = false;
  @override
  void initState() {
    controller.getAllClients();
    super.initState();
  }

  void _onScrool() {
    if (scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      setState(() {
        stateButton = true;
      });
    } else if (scrollController.position.userScrollDirection ==
        ScrollDirection.idle) {
      setState(() {
        stateButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: stateButton
          ? FloatingActionButtonLocation.endFloat
          : FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            '/add_client',
          ).then(
            (value) => controller.getAllClients(),
          );
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: Observer(
            builder: (BuildContext context) {
              return NotificationListener<ScrollNotification>(
                onNotification: (details) {
                  _onScrool();
                  return true;
                },
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: controller.listClient.length,
                  itemBuilder: (_, index) {
                    var item = controller.listClient[index];

                    return _buildCardClient(
                      item: item,
                    );
                  },
                ),
              );
            },
          ))
        ],
      ),
    );
  }

  Widget _buildCardClient({ClientModel item}) => Card(
        child: ListTile(
          title: Text(
            item.primaryName,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 18),
          ),
          subtitle: Text(item.surname),
          trailing: IconButton(
            icon: Icon(Icons.more_vert_outlined),
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => _builDialog(item),
              );
            },
          ),
        ),
      );

  Widget _builDialog(ClientModel item) {
    return AlertDialog(
      actions: [
        RaisedButton(
          color: Colors.red.shade400,
          onPressed: () async {
            await controller.deleteClient(item.id);
            await controller.getAllClients();

            Navigator.pop(context);
          },
          child: Text('Excluir'),
        ),
        RaisedButton(
          color: Colors.blueAccent,
          onPressed: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/update_client', arguments: item)
                .then((value) => controller.getAllClients());
          },
          child: Text('Atualizar'),
        ),
      ],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildRowTextDialog(label: 'Nome', value: item.primaryName),
          _buildRowTextDialog(label: 'Sobrenome', value: item.surname),
          _buildRowTextDialog(label: 'Telefone', value: item.phone),
          _buildRowTextDialog(label: 'Endereço', value: item.address),
        ],
      ),
    );
  }

  Widget _buildRowTextDialog({String label, String value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text("$label: ",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
        Expanded(
          child: Text(
            value,
            style: TextStyle(fontSize: 18),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
