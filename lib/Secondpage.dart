import 'package:flutter/material.dart';
import 'package:todomvc/main.dart';
void main() {
  runApp(SecondClass());
}
class SecondClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoListScreenPage(),
    );
  }
}

class TodoListScreenPage extends StatefulWidget {
  @override
  _TodoListScreenState1 createState() => _TodoListScreenState1();
}
class _TodoListScreenState1 extends State<TodoListScreenPage> {
  TextEditingController _date = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _idController = TextEditingController();
  List<Map<String, String>> _todos1 = [];
  @override
  void _addTodoDirectly() {
    String name = _nameController.text.trim();
    String date = _date.text.trim();
    String id = _idController.text.trim();
    if (name.isNotEmpty && date.isNotEmpty && id.isNotEmpty) {
      setState(() {
        Map<String, String> todoItem = {
          "name": name,
          "date": date,
          "ID": id,
        };
        _todos1.add(todoItem);
        // _saveTodos();
      });
      _nameController.clear();
      _date.clear();
      _idController.clear();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To-Do List"),
        backgroundColor: Colors.yellow,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: "Name",
                      prefixIcon: Icon(Icons.supervised_user_circle),
                    ),
                  ),
                  TextField(
                    readOnly: true,
                    controller: _date,
                    decoration: InputDecoration(
                      labelText: "Date",
                      prefixIcon: Icon(Icons.date_range),
                    ),
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      if (pickedDate != null) {
                        setState(() {
                          _date.text = "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                        });
                      }
                    },
                  ),
                  TextField(
                    controller: _idController,
                    decoration: InputDecoration(
                      labelText: "ID Number",
                      prefixIcon: Icon(Icons.perm_identity),
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Padding(padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:<Widget> [
            FloatingActionButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()),
              );
            },
            ),

          ],
        ),
      ),
    );
  }
}
