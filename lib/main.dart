import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:kshopper/src/services/route_service.dart';

import 'src/app.dart';

void main() async {

  GetIt getIt = GetIt.instance;

  getIt.registerSingleton<RouteService>(RouteService());

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  runApp(MyApp());
}
