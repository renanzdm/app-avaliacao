// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $HomeController = BindInject(
  (i) => HomeController(i<ClientRepositoryInterface>()),
  singleton: false,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$listClientAtom = Atom(name: '_HomeControllerBase.listClient');

  @override
  ObservableList<ClientModel> get listClient {
    _$listClientAtom.reportRead();
    return super.listClient;
  }

  @override
  set listClient(ObservableList<ClientModel> value) {
    _$listClientAtom.reportWrite(value, super.listClient, () {
      super.listClient = value;
    });
  }

  final _$messageAtom = Atom(name: '_HomeControllerBase.message');

  @override
  String get message {
    _$messageAtom.reportRead();
    return super.message;
  }

  @override
  set message(String value) {
    _$messageAtom.reportWrite(value, super.message, () {
      super.message = value;
    });
  }

  final _$modelAtom = Atom(name: '_HomeControllerBase.model');

  @override
  ClientModel get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(ClientModel value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  final _$insertClientAsyncAction =
      AsyncAction('_HomeControllerBase.insertClient');

  @override
  Future<void> insertClient() {
    return _$insertClientAsyncAction.run(() => super.insertClient());
  }

  final _$getAllClientsAsyncAction =
      AsyncAction('_HomeControllerBase.getAllClients');

  @override
  Future<void> getAllClients() {
    return _$getAllClientsAsyncAction.run(() => super.getAllClients());
  }

  final _$deleteClientAsyncAction =
      AsyncAction('_HomeControllerBase.deleteClient');

  @override
  Future<void> deleteClient(int id) {
    return _$deleteClientAsyncAction.run(() => super.deleteClient(id));
  }

  final _$updateClientAsyncAction =
      AsyncAction('_HomeControllerBase.updateClient');

  @override
  Future<void> updateClient(ClientModel client) {
    return _$updateClientAsyncAction.run(() => super.updateClient(client));
  }

  @override
  String toString() {
    return '''
listClient: ${listClient},
message: ${message},
model: ${model}
    ''';
  }
}
