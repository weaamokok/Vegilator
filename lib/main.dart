import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vegilator/src/config/router/app_router.dart';
import 'package:vegilator/src/config/themes/app_theme.dart';
import 'package:vegilator/src/presentation/cubits/cubit/nav_bar_cubit.dart';
import 'package:vegilator/src/presentation/views/root.dart';
import 'package:vegilator/src/config/router/app_router.gr.dart' as r;

void main() {
  runApp(MyApp());
}

@RoutePage()
class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<NavBarCubit>(
      create: (context) => NavBarCubit(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        routerConfig: _appRouter.config(initialRoutes: [r.Root()]),
      ),
    );
  }
}

class start extends StatelessWidget {
  const start({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
