import 'package:avaliacao_app/app/core/models/client_model.dart';
import 'package:avaliacao_app/app/core/repositories/client_repository_interface.dart';
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'home_controller.g.dart';

@Injectable(singleton: false)
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final ClientRepositoryInterface _repository;

  _HomeControllerBase(this._repository);

  @observable
  ObservableList<ClientModel> listClient = <ClientModel>[].asObservable();

  @observable
  String message = '';

  @observable
  ClientModel model = ClientModel();

  @action
  Future<void> insertClient() async {
    var result = await _repository.addClient(
        model.primaryName, model.surname, model.phone, model.address);
    result.fold((l) => left(l), (r) => message = r);
    print(message);
  }

  @action
  Future<void> getAllClients() async {
    print('chamou alClients');
    var result = await _repository.getAllClients();
    result.fold((l) => left(l), (r) => listClient = r.asObservable());
  }

  @action
  Future<void> deleteClient(int id) async {
    var result = await _repository.deleteClient(id);
    result.fold((l) => left(l), (r) => message = r);
  }

  @action
  Future<void> updateClient(ClientModel client) async {
    //print(client.toJson());
    var result = await _repository.updateClient(client.primaryName,
        client.surname, client.phone, client.address, client.id);
    result.fold((l) => left(l), (r) => message = r);
  }
}
