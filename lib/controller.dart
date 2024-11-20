import 'package:shared_preferences/shared_preferences.dart';
import 'todo.dart';
class TodoController {
  Future<List<Todo>> loadTodos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? todosData = prefs.getStringList('todos');
    return todosData != null ? Todo.decodeTodos(todosData) : [];
  }

  Future<void> saveTodos(List<Todo> todos) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('todos', Todo.encodeTodos(todos));
  }

  Future<void> addTodo(
      {required String name, required String date, required String id}) async {
    List<Todo> todos = await loadTodos();
    todos.add(Todo(name: name, date: date, id: id));
    await saveTodos(todos);
  }

  Future<void> deleteTodoAt(int index) async {
    List<Todo> todos = await loadTodos();
    todos.removeAt(index);
    await saveTodos(todos);
  }
}
