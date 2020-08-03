class User {
  int id;
  String name;
  String image;

  User(int id, String name, String image) {
    this.id = id;
    this.name = name;
    this.image = image;
  }

  User.fromJson(Map json)
      : id = json['id'],
        name = json['name'],
        image = json['image'];

  Map toJson() {
    return {'id': id, 'name': name, 'image': image};
  }
}