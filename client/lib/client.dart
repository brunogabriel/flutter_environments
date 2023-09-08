library client;

import 'package:client/client.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

abstract class Client {
  String get client;
}

@prod
@Injectable(as: Client)
class ClientProd implements Client {
  @override
  String get client => 'Client prod';
}

@dev
@Injectable(as: Client)
class ClientDev implements Client {
  @override
  String get client => 'Client dev';
}

@InjectableInit(initializerName: r'$initClient')
Future<void> configureClientDependencies(
    GetIt getIt, String environment) async {
  getIt.$initClient(environment: environment);
}
