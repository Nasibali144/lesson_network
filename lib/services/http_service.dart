import 'dart:convert';
import 'package:http/http.dart';
import 'package:lesson_network/models/todo_model.dart';

class HttpService {
  // Base url
  static String BASE_URL = "jsonplaceholder.typicode.com";

  // Header
  static Map<String, String> headers =  {
    'Content-type': 'application/json; charset=UTF-8',
  };

  // Apis
  static String API_TODO_LIST = "/todos";
  static String API_TODO_ONE = "/todos/"; // {ID}
  static String API_CREATE_TODO = "/todos";
  static String API_UPDATE_TODO = "/todos/"; //  {ID}
  static String API_EDIT_TODO = "/todos/"; //  {ID}
  static String API_DELETE_TODO = "/todos/"; //  {ID}

  // Methods
  static Future<String?> GET(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE_URL, api, params);
    Response response = await get(uri, headers: headers);
    if(response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> POST(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE_URL, api);
    Response response = await post(uri, headers: headers, body: jsonEncode(params));
    if(response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  static Future<String?> PUT(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE_URL, api);
    Response response = await put(uri, headers: headers, body: jsonEncode(params));
    if(response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> PATCH(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE_URL, api);
    Response response = await patch(uri, headers: headers, body: jsonEncode(params));
    if(response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> DELETE(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE_URL, api, params);
    Response response = await delete(uri, headers: headers);
    if(response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  // Params
  static Map<String, String> paramEmpty() {
    Map<String, String> map = {};
    return map;
  }

  static Map<String, String> paramsCreate(Todo todo) {
    Map<String, String> map = {
      'userId': todo.userId.toString(),
      'title': todo.title,
      'completed' : todo.completed.toString(),
    };
    return map;
  }

  static Map<String, String> paramsUpdate(Todo todo) {
    Map<String, String> map = {
      'userId': todo.userId.toString(),
      'id': todo.id.toString(),
      'title': todo.title,
      'completed' : todo.completed.toString(),
    };
    return map;
  }

  static Map<String, String> paramsEdit(String key, String value) {
    Map<String, String> map = {
      key: value,
    };
    return map;
  }
}