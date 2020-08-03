import 'dart:convert';

class Product {
  int id;
  String name;
  int price;

  Product({this.id = 0, this.name, this.price});

  factory Product.fromJson(Map<String, dynamic> map){
    return Product(
      id: map["id"], name: map["name"], price: map["price"]);
  }

  Map<String, dynamic> toJson(){
    return {
      "id": id, "name": name, "price": price
    };
  }

  @override
  String toString() {
      return 'Product{id: $id, name: $name, price: $price}';
  }
}

List<Product> productFromJson( String jsonData){
  final data = json.decode(jsonData);
  return List<Product>.from((data.map((item) => Product.fromJson(item))));

}

String productToJson(Product data){
  final jsonData = data.toJson();
  return json.encode(jsonData);
}