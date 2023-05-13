import 'package:avangers_order/src/config/avengers_routes.dart';
import 'package:avangers_order/src/data/services/app_http_client/app_http_client_service.dart';
import 'package:avangers_order/src/data/services/app_http_client/app_http_client_service_impl.dart';
import 'package:avangers_order/src/ui/pages/home/home_bloc.dart';
import 'package:avangers_order/src/ui/pages/home/home_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'data/datasources/datasources.dart';
import 'data/repositories/repositories.dart';
import 'domain/repositories/repositories.dart';
import 'domain/usecases/usecases.dart';

class AvengersModule extends Module {
  @override
  List<Bind> get binds => [
        //Datasources
        Bind.factory<IMarvelFilmsDatasource>(
          (i) => MarvelFilmsDatasourceImpl(i()),
        ),

        //Repositories
        Bind.factory<IMarvelFilmsRepository>(
          (i) => MarvelFilmsRepositoryImpl(i()),
        ),

        //Usecases
        Bind.factory<IMarvelFilmsUsecase>((i) => MarvelFilmsUsecase(i())),

        //Services
        Bind.factory<Dio>((i) => Dio()),
        Bind.factory<IAppHttpClientService>(
          (i) => AppDioClientService.withDefaultOptions(i()),
        ),

        //Blocs
        Bind.factory<HomeBloc>((i) => HomeBloc(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          AvengersRoutes.home,
          child: (context, args) => const HomePage(),
        ),
      ];
}
