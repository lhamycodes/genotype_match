import 'package:get_it/get_it.dart';

import 'services/navigation_service.dart';
import 'services/local_storage_service.dart';
import 'services/dialog_service.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  var lsInstance = await LocalStorageService.getInstance();
  locator.registerSingleton<LocalStorageService>(lsInstance);

  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
}
