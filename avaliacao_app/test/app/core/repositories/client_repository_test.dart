import 'package:avaliacao_app/app/core/models/client_model.dart';
import 'package:avaliacao_app/app/core/repositories/client_repository.dart';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class DioMock extends Mock implements Dio {}

main() {
  DioMock dioMock = DioMock();
  ClientRepository clientRepository = ClientRepository(dioMock);

  test('Deve retornar uma lista de ClientModel', () async {
    when(dioMock.get(any)).thenAnswer((realInvocation) async =>
        Response(data: jsonResponse, statusCode: 200));

    var result = await clientRepository.getAllClients();

    expect(result | null, isA<List<ClientModel>>());
  });

  test('Deve retornar Client created', () async {
    when(dioMock.post(any, data: anyNamed("data"))).thenAnswer(
        (realInvocation) async =>
            Response(data: "Cliente Criado", statusCode: 200));
    var result = await clientRepository.addClient(
      'teste',
      'teste',
      'teste',
      'teste',
    );

    expect(result | null, isA<String>());
  });
  test('Deve excluir e retornar Cliente Excluido', () async {
    when(dioMock.delete(any)).thenAnswer(
        (realInvocation) async => Response(data: 'Excluido', statusCode: 200));
    var result = await clientRepository.deleteClient(3);

    expect(result | null, isA<String>());
  });

  test('Deve retornar um Cliente Atualizado', () async {
    when(dioMock.put(any, data: anyNamed('data'))).thenAnswer(
        (realInvocation) async =>
            Response(data: 'Cliente atualizado', statusCode: 200));

    //var result = await clientRepository.updateClient(ClientModel(), 1);

    //expect(result | null, isA<String>());
  });
}

var jsonResponse = [
  {
    "id": 1,
    "primary_name": "Joao",
    "surname": "Marciano",
    "phone": "14998897809",
    "address": "Rua dos bobos"
  }
];
