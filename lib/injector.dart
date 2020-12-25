import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injector.config.dart';

// flutter packages pub run build_runner watch --delete-conflicting-outputs
final getIt = GetIt.instance;

@InjectableInit()
void initDependencyInjection() => $initGetIt(getIt);