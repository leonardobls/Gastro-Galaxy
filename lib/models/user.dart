class User {
  final int id;
  final String name;
  final bool isLogedIn;

  User({required this.id, required this.name, required this.isLogedIn});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      isLogedIn: json['isLogedIn'] == 1 ? true : false,
   );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'isLogedIn': isLogedIn ? "true" : "false"
    };
  }
}