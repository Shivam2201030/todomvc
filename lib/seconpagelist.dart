import 'package:flutter/material.dart';
import 'controller.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final TodoController _controller = TodoController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _idController = TextEditingController();

  Future<void> _addTodo() async {
    await _controller.addTodo(
      name: _nameController.text,
      date: _dateController.text,
      id: _idController.text,
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New To-Do"),
        backgroundColor: Colors.yellow,
      ),
      body: Padding(
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
              controller: _dateController,
              decoration: InputDecoration(
                labelText: "Date",
                prefixIcon: Icon(Icons.date_range),
              ),
              readOnly: true,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (pickedDate != null) {
                  _dateController.text =
                  "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
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
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addTodo,
              child: Text("Add"),
            ),
            // FloatingActionButton(onPressed:_addTodo,
            // backgroundColor: Colors.yellow,
            // child: Icon(Icons.add),)
          ],
        ),
      ),
    );
  }
}
