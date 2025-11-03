
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';

import 'package:kshopper/src/services/route_service.dart';

class BodyView extends StatelessWidget {
  BodyView({super.key, required this.routeBuilder}) {
    GetIt getIt = GetIt.instance;
    routeService = getIt.get<RouteService>();
  }

  late final RouteService routeService;
  final RouteBuilder routeBuilder;

  @override
  Widget build(BuildContext context) {
    List<Widget> itemsInDrawer = routeService
      .getNavigatableRoutes()
      .map((e) => ListTile(
        title: Text(e.routeTitle),
        onTap: () => Navigator.restorablePushNamed(context, e.routePath),
      ))
      .toList();
    
    return Scaffold(
      appBar: AppBar(
        title: Text(routeBuilder.routeTitle)
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(
              height: 80,
              child: DrawerHeader(
                margin: EdgeInsets.zero,
                child: Text("Where to Go"),
              ),
            ),
            ...itemsInDrawer,
          ],
        ),
      ),
      body: routeBuilder.widgetBuilder(),
    );
  }
  
}