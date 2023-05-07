// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:vegilator/main.dart' as _i1;
import 'package:vegilator/src/presentation/views/inventory/inventory_search.dart'
    as _i3;
import 'package:vegilator/src/presentation/views/root.dart' as _i2;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    MyApp.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.MyApp(),
      );
    },
    Root.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.Root(),
      );
    },
    InventorySearch.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.InventorySearch(),
      );
    },
  };
}

/// generated route for
/// [_i1.MyApp]
class MyApp extends _i4.PageRouteInfo<void> {
  const MyApp({List<_i4.PageRouteInfo>? children})
      : super(
          MyApp.name,
          initialChildren: children,
        );

  static const String name = 'MyApp';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i2.Root]
class Root extends _i4.PageRouteInfo<void> {
  const Root({List<_i4.PageRouteInfo>? children})
      : super(
          Root.name,
          initialChildren: children,
        );

  static const String name = 'Root';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i3.InventorySearch]
class InventorySearch extends _i4.PageRouteInfo<void> {
  const InventorySearch({List<_i4.PageRouteInfo>? children})
      : super(
          InventorySearch.name,
          initialChildren: children,
        );

  static const String name = 'InventorySearch';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}
