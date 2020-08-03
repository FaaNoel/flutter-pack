import 'dart:async';
import 'package:http/http.dart' as http;

const baseUrl = "http://localhost:3000/api/product";

class API {
  static Future getUsers() {
    var url = baseUrl + "/users";
    return http.get(url);
  }
}