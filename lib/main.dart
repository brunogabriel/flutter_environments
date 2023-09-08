import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'main.config.dart';
// ignore: depend_on_referenced_packages
import 'package:brand/brand.dart';
// ignore: depend_on_referenced_packages
import 'package:client/client.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Enviroments',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
      ),
      home: _HomePage(),
    );
  }
}

class _HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter environments'),
      ),
      body: Column(
        children: [
          Text(GetIt.I.get<Brand>().brand),
          Text(GetIt.I.get<Client>().client),
        ],
      ),
    );
  }
}

@InjectableInit(asExtension: false)
Future<void> configureDependencies() async {
  final getIt = GetIt.instance;
  configureBrandDependencies(getIt, Environment.dev);
  configureClientDependencies(getIt, Environment.prod);
  init(getIt, environment: Environment.prod);
}
