import 'package:avaliacao_app/app/core/repositories/client_repository.dart';
import 'package:avaliacao_app/app/modules/home/pages/add_client.dart';
import 'package:avaliacao_app/app/modules/home/pages/update_client.dart';
import 'package:dio/dio.dart';

import 'home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds =>
      [$HomeController, $ClientRepository, Bind((i) => Dio())];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => HomePage()),
        ModularRouter('/add_client', child: (_, args) => AddClient()),
        ModularRouter('/update_client',
            child: (_, args) => UpdateClient(model: args.data)),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
