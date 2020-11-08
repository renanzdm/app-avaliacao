import 'package:avaliacao_app/app/core/errors/erros.dart';
import 'package:avaliacao_app/app/core/models/client_model.dart';
import 'package:dartz/dartz.dart';

abstract class ClientRepositoryInterface {
  Future<Either<Failure, List<ClientModel>>> getAllClients();
  Future<Either<Failure, String>> addClient(
      String primaryName, String surname, String phone, String address);
  Future<Either<Failure, String>> updateClient(
      String primaryName, String surname, String phone, String address, int id);
  Future<Either<Failure, String>> deleteClient(int id);
}
