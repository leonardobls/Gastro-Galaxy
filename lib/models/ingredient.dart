class Ingredient {
  int id;
  String name;
  bool isAvailable;

  Ingredient({required this.id, required this.name, required this.isAvailable });

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      id: json['id'],
      name: json['name'],
      isAvailable: json['isAvailable'] == 1 ? true : false
   );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'isAvailable': isAvailable ? true : false
    };
  }
}