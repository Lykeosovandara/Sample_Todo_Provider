import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'services/todo_service.dart';
import 'utils/http.dart';

List<SingleChildCloneableWidget> providers = [
  ...independentProvider,
  ...dependentProvider
];

List<SingleChildCloneableWidget> independentProvider = [
   Provider<Dio>.value(
    value: dio,
  ),
];
List<SingleChildCloneableWidget> dependentProvider = [
   ProxyProvider<Dio, TodoService>(
    builder: (context, Dio http, TodoService todoService) {
      return TodoService(https: http);
    },
  )
];
