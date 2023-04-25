// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:vegilator/main.dart' as _i1;
import 'package:vegilator/src/presentation/views/root.dart' as _i2;

abstract class $AppRouter extends _i3.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    MyApp.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.MyApp(),
      );
    },
    Root.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.Root(),
      );
    },
  };
}

/// generated route for
/// [_i1.MyApp]
class MyApp extends _i3.PageRouteInfo<void> {
  const MyApp({List<_i3.PageRouteInfo>? children})
      : super(
          MyApp.name,
          initialChildren: children,
        );

  static const String name = 'MyApp';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}

/// generated route for
/// [_i2.Root]
class Root extends _i3.PageRouteInfo<void> {
  const Root({List<_i3.PageRouteInfo>? children})
      : super(
          Root.name,
          initialChildren: children,
        );

  static const String name = 'Root';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}
