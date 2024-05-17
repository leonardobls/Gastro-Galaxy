import 'package:gastro_galaxy/models/ingredient.dart';

class Recipe {
  final int? id;
  final String name;
  final String description;
  final String url;
  final int? categoryId;
  List<Ingredient>? ingredients;

  Recipe({
    this.id,
    required this.name,
    required this.description,
    required this.url,
    this.categoryId,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'],
      name: json['name'],
      categoryId: json['categoryId'],
      description: json['description'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'categoryId': categoryId,
      'description': description,
      'imageUrl': url,
    };
  }
}
