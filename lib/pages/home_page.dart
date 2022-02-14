import 'package:flutter/material.dart';
import 'package:lesson_network/models/todo_model.dart';
import 'package:lesson_network/services/http_service.dart';

class HomePage extends StatefulWidget {
  static const String id = "/home_page";
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String data = "No Data";

  @override
  void initState() {
    super.initState();
    apiDeleteTodo();
  }

  void apiGetTodoList() {
    HttpService.GET(HttpService.API_TODO_LIST, HttpService.paramEmpty()).then((value) {
      if(value != null) {
        getResponse(value);
      }
    });
  }

  void apiCreateTodo() {
    Todo todo = Todo(userId: 1, id: -1, title: "title", completed: true);
    HttpService.POST(HttpService.API_CREATE_TODO, HttpService.paramsCreate(todo)).then((value) {
      if(value != null) {
        print(value);
        apiGetTodoList();
      } else {
        //error msg
      }
    });
  }

  void apiUpdateTodo() {
    Todo todo = Todo(userId: 1, id: 55, title: "title", completed: true);
    HttpService.PUT(HttpService.API_UPDATE_TODO + todo.id.toString(), HttpService.paramsUpdate(todo)).then((value) {
      if(value != null) {
        print(value);
        apiGetTodoList();
      } else {
        //error msg
      }
    });
  }

  void apiEditTodo() {
    Todo todo = Todo(userId: 1, id: 55, title: "title", completed: true);
    HttpService.PATCH(HttpService.API_EDIT_TODO + todo.id.toString(), HttpService.paramsEdit('title', "Flutter")).then((value) {
      if(value != null) {
        print(value);
      } else {
        //error msg
      }
    });
  }

  void apiDeleteTodo() {
    Todo todo = Todo(userId: 1, id: 55, title: "title", completed: true);
    HttpService.DELETE(HttpService.API_DELETE_TODO + todo.id.toString(), HttpService.paramEmpty()).then((value) {
      if(value != null) {
        print(value);
        apiGetTodoList();
      } else {
        //error msg
      }
    });
  }

  void getResponse(String response) {
    setState(() {
      data = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Text(data),
        ),
      ),
    );
  }
}
