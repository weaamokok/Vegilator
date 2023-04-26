import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vegilator/src/config/router/app_router.dart';
import 'package:vegilator/src/config/themes/app_theme.dart';
import 'package:vegilator/src/domain/repositories/database_repository.dart';
import 'package:vegilator/src/locator.dart';
import 'package:vegilator/src/presentation/cubits/cubit/nav_bar_cubit.dart';
import 'package:vegilator/src/presentation/cubits/cubit/vegetabes_cubit.dart';
import 'package:vegilator/src/config/router/app_router.gr.dart' as r;
final appRouter = AppRouter();

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  
  runApp(MyApp());
}

@RoutePage()
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NavBarCubit(),
        ),
        BlocProvider(
          create: (context) => VegetabesCubit(
            locator<DatabaseRepository>(),
          )..getAllSavedVegetables(),
        )
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        routerConfig: appRouter.config(initialRoutes: [const r.Root()]),
      ),
    );
  }
}

