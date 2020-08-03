import 'package:flutter/foundation.dart';
import 'package:flutter_nub/Models.dart';
import 'package:http/http.dart';

class ApiService {
  final String baseUrl = "http://127.0.0.1:3000/api/products";
  Client client = Client();

  Future<List<Product>> getProduct() async {
    final response = await client.get("$baseUrl/api/profile");
    if(response.statusCode == 200){
      return productFromJson(response.body);
    }else{
      return null;
    }

  }



}
