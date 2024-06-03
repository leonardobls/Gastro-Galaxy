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
      id: json['Id'],
      name: json['Name'],
      amount: json['Amount'],
      imageUrl: json['Url'],
      isAvailable: json['IsAvailable'] == 1 ? true : false,
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
