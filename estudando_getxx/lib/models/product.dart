class Product {
  final int id;
  final String name;
  final String description;
  final double price;
  final double rate;
  bool isFavorite = false;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.rate,
  });

  static Product fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['Product ID'],
      name: json['Name'],
      description: json['Description'],
      price: json['Price'].toDouble(),
      rate: json['Rating Avg'].toDouble(),
    );
  }
}
