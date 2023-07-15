class User {
  late int id;
  late String name;
  late String role;

  User(this.id, this.name, this.role);

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'role': role};

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    role = json['role'];
  }
}
