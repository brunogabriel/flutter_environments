library brand;

import 'package:brand/brand.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

abstract class Brand {
  String get brand;
}

@prod
@Injectable(as: Brand)
class BrandProd implements Brand {
  @override
  String get brand => 'Brand prod';
}

@dev
@Injectable(as: Brand)
class BrandDev implements Brand {
  @override
  String get brand => 'Brand dev';
}

@InjectableInit(initializerName: r'$initBrand')
Future<void> configureBrandDependencies(GetIt getIt, String environment) async {
  getIt.$initBrand(environment: environment);
}
