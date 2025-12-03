class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final double? originalPrice;
  final String imageUrl;
  final List<String> imageUrls;
  final List<String> colors;
  final List<String> sizes;
  final String category;
  final double rating;
  final int reviewCount;
  final bool isFeatured;
  final bool isNew;
  final int stock;
  final List<String> tags;

  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    this.originalPrice,
    required this.imageUrl,
    this.imageUrls = const [],
    required this.colors,
    this.sizes = const [],
    required this.category,
    this.rating = 0.0,
    this.reviewCount = 0,
    this.isFeatured = false,
    this.isNew = false,
    this.stock = 0,
    this.tags = const [],
  });

  String get formattedPrice => '\$${price.toStringAsFixed(2)}';
  String? get formattedOriginalPrice => originalPrice != null ? '\$${originalPrice!.toStringAsFixed(2)}' : null;
  bool get hasDiscount => originalPrice != null && originalPrice! > price;
  double get discountPercentage => hasDiscount ? ((originalPrice! - price) / originalPrice! * 100) : 0;
  bool get inStock => stock > 0;

  Product copyWith({
    String? id,
    String? name,
    String? description,
    double? price,
    double? originalPrice,
    String? imageUrl,
    List<String>? imageUrls,
    List<String>? colors,
    List<String>? sizes,
    String? category,
    double? rating,
    int? reviewCount,
    bool? isFeatured,
    bool? isNew,
    int? stock,
    List<String>? tags,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      originalPrice: originalPrice ?? this.originalPrice,
      imageUrl: imageUrl ?? this.imageUrl,
      imageUrls: imageUrls ?? this.imageUrls,
      colors: colors ?? this.colors,
      sizes: sizes ?? this.sizes,
      category: category ?? this.category,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      isFeatured: isFeatured ?? this.isFeatured,
      isNew: isNew ?? this.isNew,
      stock: stock ?? this.stock,
      tags: tags ?? this.tags,
    );
  }
}

class CartItem {
  final Product product;
  final int quantity;
  final String selectedColor;
  final String selectedSize;

  CartItem({
    required this.product,
    required this.quantity,
    required this.selectedColor,
    required this.selectedSize,
  });

  double get totalPrice => product.price * quantity;

  CartItem copyWith({
    Product? product,
    int? quantity,
    String? selectedColor,
    String? selectedSize,
  }) {
    return CartItem(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      selectedColor: selectedColor ?? this.selectedColor,
      selectedSize: selectedSize ?? this.selectedSize,
    );
  }
}