import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'providers/home_provider.dart';
import 'services/todo_service.dart';
import 'utils/http.dart';

List<SingleChildCloneableWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ...uiConsumableWidget
];

List<SingleChildCloneableWidget> independentServices = [
  Provider<Dio>.value(
    value: dio,
  ),
];
List<SingleChildCloneableWidget> dependentServices = [
  ProxyProvider<Dio, TodoService>(
    builder: (context, Dio http, TodoService todoService) {
      return TodoService(https: http);
    },
  ),
];

List<SingleChildCloneableWidget> uiConsumableWidget = [
  ChangeNotifierProxyProvider<TodoService, HomeProvider>(
    initialBuilder: null,
    builder: (context, TodoService todoService, homeProvider) {
      return HomeProvider(todoService: todoService);
    },
  )
];
