import '../features/authentication/models/product.dart';

class ProductsData {
  static final List<Product> allProducts = [
    Product(
      id: '1',
      name: 'Modern Wireless Headphones',
      description: 'Premium sound quality with noise cancellation feature. Perfect for music lovers and professionals. Experience crystal clear audio with our advanced acoustic technology.',
      price: 199.99,
      originalPrice: 249.99,
      imageUrl: 'assets/images/headphones.jpg',
      imageUrls: [
        'assets/images/headphones.jpg',
        'assets/images/headphones.jpg',
        'assets/images/headphones.jpg',
      ],
      colors: ['#2D2D2D', '#E5E5E5', '#C9A96E'],
      sizes: ['One Size'],
      category: 'Electronics',
      rating: 4.8,
      reviewCount: 124,
      isFeatured: true,
      isNew: true,
      stock: 15,
      tags: ['wireless', 'noise-cancelling', 'premium'],
    ),
    Product(
      id: '2',
      name: 'Minimalist Watch',
      description: 'Elegant design with premium materials. Water resistant up to 50 meters. Perfect for both casual and formal occasions.',
      price: 149.99,
      imageUrl: 'assets/images/watch.jpg',
      imageUrls: [
        'assets/images/watch.jpg',
        'assets/images/watch.jpg',
        'assets/images/watch.jpg',
      ],
      colors: ['#2D2D2D', '#C9A96E', '#8B4513'],
      sizes: ['Small', 'Medium', 'Large'],
      category: 'Accessories',
      rating: 4.6,
      reviewCount: 89,
      isFeatured: true,
      stock: 8,
      tags: ['minimalist', 'water-resistant', 'luxury'],
    ),
    Product(
      id: '3',
      name: 'Organic Cotton T-Shirt',
      description: 'Comfortable and sustainable clothing made from 100% organic cotton. Eco-friendly and perfect for everyday wear.',
      price: 29.99,
      originalPrice: 39.99,
      imageUrl: 'assets/images/tshirt.jpg',
      imageUrls: [
        'assets/images/tshirt.jpg',
        'assets/images/tshirt.jpg',
        'assets/images/tshirt.jpg',
      ],
      colors: ['#FFFFFF', '#2D2D2D', '#4682B4'],
      sizes: ['S', 'M', 'L', 'XL'],
      category: 'Clothing',
      rating: 4.4,
      reviewCount: 203,
      stock: 25,
      tags: ['organic', 'sustainable', 'cotton'],
    ),
    Product(
      id: '4',
      name: 'Smart Fitness Tracker',
      description: 'Track your steps, heart rate, and sleep patterns with this advanced fitness tracker. Stay motivated with smart notifications.',
      price: 79.99,
      imageUrl: 'assets/images/fitness_tracker.jpg',
      imageUrls: [
        'assets/images/fitness_tracker.jpg',
        'assets/images/fitness_tracker.jpg',
        'assets/images/fitness_tracker.jpg',
      ],
      colors: ['#2D2D2D', '#FF6B6B', '#4ECDC4'],
      sizes: ['One Size'],
      category: 'Electronics',
      rating: 4.5,
      reviewCount: 156,
      isNew: true,
      stock: 12,
      tags: ['fitness', 'smart', 'health'],
    ),
    Product(
      id: '5',
      name: 'Ceramic Coffee Mug',
      description: 'Handcrafted ceramic mug perfect for your morning coffee or tea. Microwave and dishwasher safe.',
      price: 24.99,
      imageUrl: 'assets/images/mug.jpg',
      imageUrls: [
        'assets/images/mug.jpg',
        'assets/images/mug.jpg',
        'assets/images/mug.jpg',
      ],
      colors: ['#FFFFFF', '#2D2D2D', '#C9A96E'],
      sizes: ['Standard'],
      category: 'Home',
      rating: 4.7,
      reviewCount: 67,
      stock: 30,
      tags: ['ceramic', 'handcrafted', 'kitchen'],
    ),
    Product(
      id: '6',
      name: 'Leather Backpack',
      description: 'Durable and stylish backpack made from genuine leather with multiple compartments. Perfect for work and travel.',
      price: 129.99,
      originalPrice: 159.99,
      imageUrl: 'assets/images/backpack.jpg',
      imageUrls: [
        'assets/images/backpack.jpg',
        'assets/images/backpack.jpg',
        'assets/images/backpack.jpg',
      ],
      colors: ['#8B4513', '#2D2D2D', '#654321'],
      sizes: ['15"', '17"'],
      category: 'Accessories',
      rating: 4.9,
      reviewCount: 98,
      isFeatured: true,
      stock: 5,
      tags: ['leather', 'premium', 'travel'],
    ),
    Product(
      id: '7',
      name: 'Wireless Earbuds',
      description: 'True wireless earbuds with premium sound quality and long battery life. Perfect for workouts and daily commutes.',
      price: 89.99,
      imageUrl: 'assets/images/earbuds.jpg',
      imageUrls: [
        'assets/images/earbuds.jpg',
        'assets/images/earbuds.jpg',
        'assets/images/earbuds.jpg',
      ],
      colors: ['#2D2D2D', '#FFFFFF', '#FF6B6B'],
      sizes: ['One Size'],
      category: 'Electronics',
      rating: 4.3,
      reviewCount: 187,
      isNew: true,
      stock: 20,
      tags: ['wireless', 'earbuds', 'audio'],
    ),
    Product(
      id: '8',
      name: 'Sunglasses',
      description: 'UV protection sunglasses with polarized lenses. Stylish design for maximum comfort and eye protection.',
      price: 59.99,
      originalPrice: 79.99,
      imageUrl: 'assets/images/sunglasses.jpg',
      imageUrls: [
        'assets/images/sunglasses.jpg',
        'assets/images/sunglasses.jpg',
        'assets/images/sunglasses.jpg',
      ],
      colors: ['#2D2D2D', '#8B4513', '#1E3A8A'],
      sizes: ['One Size'],
      category: 'Accessories',
      rating: 4.6,
      reviewCount: 134,
      stock: 18,
      tags: ['uv-protection', 'polarized', 'style'],
    ),
  ];

  static List<Product> get featuredProducts =>
      allProducts.where((product) => product.isFeatured).toList();

  static List<Product> get newProducts =>
      allProducts.where((product) => product.isNew).toList();

  static List<Product> getProductsByCategory(String category) =>
      allProducts.where((product) => product.category == category).toList();

  static List<Product> searchProducts(String query) {
    if (query.isEmpty) return allProducts;
    return allProducts.where((product) =>
        product.name.toLowerCase().contains(query.toLowerCase()) ||
        product.category.toLowerCase().contains(query.toLowerCase()) ||
        product.tags.any((tag) => tag.toLowerCase().contains(query.toLowerCase()))).toList();
  }
}