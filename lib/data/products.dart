import '../models/product.dart';

class ProductsData {
  static final List<Product> allProducts = [
    Product(
      id: '1',
      name: 'Modern Wireless Headphones',
      description: 'Premium sound quality with noise cancellation feature. Perfect for music lovers and professionals.',
      price: 199.99,
      imageUrl: 'assets/images/headphones.jpg',
      colors: ['#2D2D2D', '#E5E5E5', '#C9A96E'],
      category: 'Electronics',
      rating: 4.8,
      reviewCount: 124,
      isFeatured: true,
    ),
    Product(
      id: '2',
      name: 'Minimalist Watch',
      description: 'Elegant design with premium materials. Water resistant up to 50 meters.',
      price: 149.99,
      imageUrl: 'assets/images/watch.jpg',
      colors: ['#2D2D2D', '#C9A96E', '#8B4513'],
      category: 'Accessories',
      rating: 4.6,
      reviewCount: 89,
      isFeatured: true,
    ),
    Product(
      id: '3',
      name: 'Organic Cotton T-Shirt',
      description: 'Comfortable and sustainable clothing made from 100% organic cotton.',
      price: 29.99,
      imageUrl: 'assets/images/tshirt.jpg',
      colors: ['#FFFFFF', '#2D2D2D', '#4682B4'],
      category: 'Clothing',
      rating: 4.4,
      reviewCount: 203,
    ),
    Product(
      id: '4',
      name: 'Smart Fitness Tracker',
      description: 'Track your steps, heart rate, and sleep patterns with this advanced fitness tracker.',
      price: 79.99,
      imageUrl: 'assets/images/fitness_tracker.jpg',
      colors: ['#2D2D2D', '#FF6B6B', '#4ECDC4'],
      category: 'Electronics',
      rating: 4.5,
      reviewCount: 156,
    ),
    Product(
      id: '5',
      name: 'Ceramic Coffee Mug',
      description: 'Handcrafted ceramic mug perfect for your morning coffee or tea.',
      price: 24.99,
      imageUrl: 'assets/images/mug.jpg',
      colors: ['#FFFFFF', '#2D2D2D', '#C9A96E'],
      category: 'Home',
      rating: 4.7,
      reviewCount: 67,
    ),
    Product(
      id: '6',
      name: 'Leather Backpack',
      description: 'Durable and stylish backpack made from genuine leather with multiple compartments.',
      price: 129.99,
      imageUrl: 'assets/images/backpack.jpg',
      colors: ['#8B4513', '#2D2D2D', '#654321'],
      category: 'Accessories',
      rating: 4.9,
      reviewCount: 98,
      isFeatured: true,
    ),
  ];

  static List<Product> get featuredProducts =>
      allProducts.where((product) => product.isFeatured).toList();

  static List<Product> getProductsByCategory(String category) =>
      allProducts.where((product) => product.category == category).toList();
}