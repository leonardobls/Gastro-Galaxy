class Ingredient {
  int? id;
  String name;
  String amount;
  String imageUrl;
  bool isAvailable;

  Ingredient({
    this.id,
    required this.name,
    required this.amount,
    required this.imageUrl,
    required this.isAvailable,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      id: json['id'],
      name: json['name'],
      amount: json['amount'],
      imageUrl: json['imageUrl'],
      isAvailable: json['isAvailable'] == 1 ? true : false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'amount': amount,
      'imageUrl': imageUrl,
      'isAvailable': isAvailable ? true : false,
    };
  }
}
