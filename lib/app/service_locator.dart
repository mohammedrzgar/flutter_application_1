//ServiceLocator implemented with the Get_It Package for Dependency Injections

import 'package:get_it/get_it.dart';

import '../screens/main/main_viewmodel.dart';
import '../services/note/note_service.dart';
// import '../services/rest.dart';
import '../services/note/note_service_mock.dart';

// import '../services/rest_services.dart';

GetIt locator = GetIt.instance;

void initializeServiceLocator() {
  // Services
  // locator.registerLazySingleton<RestService>(
      // () => const RestService(baseUrl: 'http://127.0.0.1:3000'));

  locator.registerLazySingleton<NoteService>(() => NoteMockService());
  // locator.registerLazySingleton<NoteService>(() => NoteServiceRest());
  // locator.registerLazySingleton<NoteService>(() => NoteServiceLocal());

  // Viewmodels
  locator.registerLazySingleton<MainViewmodel>(() => MainViewmodel());
}