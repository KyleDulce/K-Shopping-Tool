
import 'package:flutter/material.dart';
import 'package:kshopper/src/views/bad_view.dart';
import 'package:kshopper/src/views/home_view.dart';

class RouteService {
  static final Map<String, RouteBuilder> routes = {
      "/": RouteBuilder( routeTitle: "Home", widgetBuilder: () => const HomeView()),
  };

  static final RouteBuilder defaultRoute = RouteBuilder(
    routeTitle: "Error",
    widgetBuilder: () => const BadView()
  );
  
  RouteBuilder getRoute(String? route) {
    if(routes.containsKey(route)) {
      return routes[route]!;
    } else {
      return defaultRoute;
    }
  }

  List<ViewableRoute> getNavigatableRoutes() {
    return routes.entries
      .map((e) => ViewableRoute(routePath: e.key, routeTitle: e.value.routeTitle))
      .toList();
  }
}

class RouteBuilder {

  const RouteBuilder({
    required this.routeTitle,
    required this.widgetBuilder,
  });

  final String routeTitle;
  final Widget Function() widgetBuilder;
}

class ViewableRoute {
  const ViewableRoute({
    required this.routeTitle,
    required this.routePath
  });

  final String routeTitle;
  final String routePath;
}

