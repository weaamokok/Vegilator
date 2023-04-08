import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:auto_route_generator/builder.dart';
import 'package:auto_route_generator/utils.dart';
part 'app_router.gr.dart';

@AutoRouterConfig(generateForDir: [])
class AppRouter extends _$AppRouter {
  @override
  // TODO: implement routes
  List<AutoRoute> get routes => throw UnimplementedError();
}

final appRouter = AppRouter();
