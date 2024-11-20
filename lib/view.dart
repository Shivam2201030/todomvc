import 'package:flutter/material.dart';
import 'controller.dart';
import 'todo.dart';
import 'seconpagelist.dart';
class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final TodoController _controller = TodoController();
  List<Todo> _todos = [];

  @override
  void initState() {
    super.initState();
    _loadTodos();
  }

  Future<void> _loadTodos() async {
    List<Todo> todos = await _controller.loadTodos();
    setState(() {
      _todos = todos;
    });
  }

  Future<void> _deleteTodoAt(int index) async {
    await _controller.deleteTodoAt(index);
    _loadTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aesthetic To-Do List"),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: _todos.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: ListTile(
              title: Text(
                "Name: ${_todos[index].name}\nDate: ${_todos[index].date}\nID: ${_todos[index].id}",
                style: TextStyle(fontSize: 18),
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => _deleteTodoAt(index),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SecondPage()),
          ).then((_) => _loadTodos());
        },
        backgroundColor: Colors.greenAccent,
        child: Icon(Icons.arrow_right,size: 45,),

      ),
    );
  }
}
