import 'dart:developer';

import 'package:avaliacao_app/app/core/errors/erros.dart';
import 'package:avaliacao_app/app/core/models/client_model.dart';
import 'package:avaliacao_app/app/core/utils/url.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'client_repository_interface.dart';

part 'client_repository.g.dart';

@Injectable()
class ClientRepository implements ClientRepositoryInterface {
  final Dio dio;

  ClientRepository(this.dio);

  @override
  Future<Either<Failure, List<ClientModel>>> getAllClients() async {
    try {
      Response response = await dio.get("$URL/clients");
      return right(
          (response.data as List).map((e) => ClientModel.fromJson(e)).toList());
    } on DioError catch (e) {
      print(e.message);
      return left(FailedGetClients());
    }
  }

  @override
  Future<Either<Failure, String>> addClient(
      String primaryName, String surname, String phone, String address) async {
    try {
      Response response = await dio.post("$URL/add_client", data: {
        "primary_name": primaryName,
        "surname": surname,
        "phone": phone,
        "address": address
      });
      return right('Sucesso');
    } on DioError catch (e) {
      print(e.message);
      return left(FailedInsertClient());
    }
  }

  @override
  Future<Either<Failure, String>> deleteClient(int id) async {
    try {
      Response response = await dio.delete("$URL/delete/clients/$id");
      return right('Cliente excluido');
    } on DioError catch (e) {
      print(e.message);
      return left(FailedInDeleteClient());
    }
  }

  @override
  Future<Either<Failure, String>> updateClient(String primaryName,
      String surname, String phone, String address, int id) async {
    print('primaryName $primaryName');
    print('surname $surname');
    print('phone $phone');
    print('address $address');
    print('id $id');

    try {
      Response response = await dio.put("$URL/update/clients/$id", data: {
        "primary_name": primaryName,
        "surname": surname,
        "phone": phone,
        "address": address
      });
      return right('Atualizado com sucesso');
    } on DioError catch (e) {
      print(e.message);
      return left(FailedInUpdateClient());
    }
  }
}
