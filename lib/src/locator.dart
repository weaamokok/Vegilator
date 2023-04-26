import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:vegilator/src/data/repositories/database_repository_impl.dart';
import 'package:vegilator/src/domain/repositories/database_repository.dart';
import 'data/datasources/local/app_database.dart';

//First of all, we need to build our database and this is what we’re doing at the first 2 lines in the initializeDependencies method
final GetIt locator = GetIt.instance;
Future<void> initializeDependencies() async {
  //We’re getting our database built using the databaseBuilder in the FloorAppDatabase which takes a name (databaseName) and the build method will then return asynchronously an instance of our database (AppDatabase)
  final db = await $FloorAppDatabase.databaseBuilder('Vegelator').build();
  //Once we get our database, we register it as a singleton in our locator.
  locator.registerSingleton<AppDatabase>(db);
  //Next, the DatabaseRepository depends on the database, so we provided an instance of the registered database in line 3.
  // locator.registerSingleton<DatabaseRepository>(
  //     DatabseRepositoryImpl(locator<AppDatabase>()));
  locator.registerSingleton<DatabaseRepository>(
      DatabseRepositoryImpl(locator<AppDatabase>()));
  final dio = Dio();
  dio.interceptors.add(AwesomeDioInterceptor());
  locator.registerSingleton<Dio>(dio);
}
