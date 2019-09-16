import 'package:flutter/foundation.dart';
import 'package:sample_todo/src/models/todo_model.dart';
import 'package:sample_todo/src/services/todo_service.dart';

class HomeProvider extends ChangeNotifier {
  TodoService todoService;

  HomeProvider({@required this.todoService}){
    fetchMoreTodo();
  }

  // status of loading pagination or not
  bool _isFetching = false;

  // Offset of the pagination
  int _start = 0;

  // Max count of api
  int _limit = 15;

  // Outof item to load
  bool _isOutOfRange = false;

  // Todo load from api
  List<TodoModel> _todos = [];

  // Error Object from API
  Object _error;

  /// Is underload load pagination
  bool get inFetching => _isFetching;

  /// Error object after requet api
  bool get error => _error;

  /// Is out of pagination
  bool get isOutOfRange => _isOutOfRange;

  /// Todo load from api
  List<TodoModel> get todos => _todos;


  /// Refresh old data
  Future<void> reset() async {
    _start = 0;
    _isOutOfRange = false;
    _todos = [];
    await Future.value([]);
    notifyListeners();
  }

  /// Load todo
  Future<void> fetchMoreTodo() async {
    try {
      _isFetching = true;
      notifyListeners();
      final todos = await todoService.fetchTodos(limit: _limit, start: _start);

      if (todos.length < _limit)
        _isOutOfRange = true;
      else
        _start += _limit;

      _todos.addAll(todos);

      _isFetching = false;
      notifyListeners();
    } catch (e) {
      _error = e;
      print(e);
      notifyListeners();
    }
  }
}
