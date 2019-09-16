import 'package:flutter/material.dart';
import 'package:sample_todo/src/provider_setup.dart';
import 'package:provider/provider.dart';
import 'package:sample_todo/src/routes.dart';

import 'utils/http.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        navigatorKey: alice.getNavigatorKey(),
        onGenerateRoute: generatedRoutes,
        title: "To Do",
        initialRoute: '/',
      ),
    );
  }
}
