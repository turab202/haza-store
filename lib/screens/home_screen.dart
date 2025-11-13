import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haza_store/data/products.dart';
import 'package:haza_store/models/product.dart';
import 'package:haza_store/screens/product_screen.dart';
import 'package:haza_store/widgets/header.dart';
import 'package:haza_store/widgets/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> categories = ['All', 'Electronics', 'Clothing', 'Accessories', 'Home'];
  String selectedCategory = 'All';
  int cartItemCount = 3; // Sample cart count

  List<Product> get filteredProducts {
    if (selectedCategory == 'All') {
      return ProductsData.allProducts;
    }
    return ProductsData.getProductsByCategory(selectedCategory);
  }

  void _onProductTap(Product product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductScreen(product: product),
      ),
    );
  }

  void _onAddToCart(Product product) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${product.name} added to cart'),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
    setState(() {
      cartItemCount++;
    });
  }

  void _onCartPressed() {
    // Navigate to cart screen
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Cart screen coming soon!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Header(
        title: 'Haza Store',
        showCartIcon: true,
        cartItemCount: cartItemCount,
        onCartPressed: _onCartPressed,
      ),
      body: Column(
        children: [
          // Category Filter
          SizedBox(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: FilterChip(
                    label: Text(
                      category,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    selected: selectedCategory == category,
                    onSelected: (selected) {
                      setState(() {
                        selectedCategory = category;
                      });
                    },
                    backgroundColor: Colors.grey.shade100,
                    selectedColor: const Color(0xFF2D2D2D),
                    labelStyle: TextStyle(
                      color: selectedCategory == category ? Colors.white : const Color(0xFF2D2D2D),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                );
              },
            ),
          ),

          // Featured Section
          if (selectedCategory == 'All') ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Text(
                    'Featured Products',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF2D2D2D),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 240,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: ProductsData.featuredProducts.length,
                itemBuilder: (context, index) {
                  final product = ProductsData.featuredProducts[index];
                  return Container(
                    width: 180,
                    margin: const EdgeInsets.only(right: 16),
                    child: ProductCard(
                      product: product,
                      onTap: () => _onProductTap(product),
                      onAddToCart: () => _onAddToCart(product),
                    ),
                  );
                },
              ),
            ),
          ],

          // All Products Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Text(
                  selectedCategory == 'All' ? 'All Products' : selectedCategory,
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF2D2D2D),
                  ),
                ),
                const Spacer(),
                Text(
                  '${filteredProducts.length} items',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),

          // Products Grid
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.7,
                ),
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {
                  final product = filteredProducts[index];
                  return ProductCard(
                    product: product,
                    onTap: () => _onProductTap(product),
                    onAddToCart: () => _onAddToCart(product),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}