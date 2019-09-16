import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:sample_todo/src/models/todo_model.dart';
import 'package:sample_todo/src/utils/base_url.dart';

class TodoService {
  Dio https;

  TodoService({@required this.https});

  /// Fetch todo with pagination [start] and [limit]
  Future<List<TodoModel>> fetchTodos({
    @required int start,
    @required int limit,
  }) async {
    final response = await https.get(BaseUrl.todoUri, queryParameters: {
      "_start": start,
      "_limit": limit,
    });

    List<TodoModel> todos = [];

    for (var parsedJson in response.data) {
      todos.add(TodoModel.fromJson(parsedJson));
    }

    return todos;
  }
}
