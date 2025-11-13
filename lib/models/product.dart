class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final List<String> colors;
  final String category;
  final double rating;
  final int reviewCount;
  final bool isFeatured;

  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.colors,
    required this.category,
    this.rating = 0.0,
    this.reviewCount = 0,
    this.isFeatured = false,
  });

  String get formattedPrice => '\$${price.toStringAsFixed(2)}';
  
  Product copyWith({
    String? id,
    String? name,
    String? description,
    double? price,
    String? imageUrl,
    List<String>? colors,
    String? category,
    double? rating,
    int? reviewCount,
    bool? isFeatured,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      colors: colors ?? this.colors,
      category: category ?? this.category,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      isFeatured: isFeatured ?? this.isFeatured,
    );
  }
}