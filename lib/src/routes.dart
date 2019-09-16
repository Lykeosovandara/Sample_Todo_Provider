import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_todo/src/screens/home.dart';

import 'providers/home_provider.dart';
import 'services/todo_service.dart';

Route generatedRoutes(RouteSettings settings) {
  if (settings.name == '/') {
    return MaterialPageRoute(builder: (BuildContext context) {
      return ChangeNotifierProxyProvider<TodoService, HomeProvider>(
        initialBuilder: null,
        builder: (context, TodoService todoService, homeProvider) {
          return HomeProvider(
            todoService: todoService,
          );
        },
        child: Home(),
      );
    });
  }

  return MaterialPageRoute(
    builder: (context) {
      return Text("Unknown");
    },
  );
}
