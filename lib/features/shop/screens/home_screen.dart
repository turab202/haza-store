import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haza_store/data/products.dart';
import 'package:haza_store/features/authentication/models/product.dart';
import 'package:haza_store/features/shop/screens/product_screen.dart';
import 'package:haza_store/features/shop/screens/cart_screen.dart';
import 'package:haza_store/features/shop/screens/search_screen.dart';
import 'package:haza_store/common/widgets/header.dart';
import 'package:haza_store/common/widgets/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> categories = ['All', 'Electronics', 'Clothing', 'Accessories', 'Home'];
  String selectedCategory = 'All';
  int cartItemCount = 3;
  final TextEditingController _searchController = TextEditingController();

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
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {},
        ),
      ),
    );
    setState(() {
      cartItemCount++;
    });
  }

// Change this line in home_screen.dart (around line 60):
void _onCartPressed() {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => CartScreen()), // Remove 'const'
  );
}
  void _onSearchTap() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SearchScreen()),
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
      body: CustomScrollView(
        slivers: [
          // Search Bar
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: InkWell(
                onTap: _onSearchTap,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.search, color: Colors.grey.shade500, size: 20),
                      const SizedBox(width: 12),
                      Text(
                        'Search products...',
                        style: GoogleFonts.poppins(
                          color: Colors.grey.shade500,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Category Filter
          SliverToBoxAdapter(
            child: SizedBox(
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
          ),

          // New Arrivals Section
          if (selectedCategory == 'All')
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
                child: Row(
                  children: [
                    Text(
                      'New Arrivals 🔥',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF2D2D2D),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'See All',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),

          if (selectedCategory == 'All')
            SliverToBoxAdapter(
              child: SizedBox(
                height: 260,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: ProductsData.newProducts.length,
                  itemBuilder: (context, index) {
                    final product = ProductsData.newProducts[index];
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
            ),

          // Featured Section
          if (selectedCategory == 'All')
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
                child: Row(
                  children: [
                    Text(
                      'Featured Products ⭐',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF2D2D2D),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'See All',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),

          if (selectedCategory == 'All')
            SliverToBoxAdapter(
              child: SizedBox(
                height: 260,
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
            ),

          // All Products Header
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
              child: Row(
                children: [
                  Text(
                    selectedCategory == 'All' ? 'All Products' : selectedCategory,
                    style: GoogleFonts.poppins(
                      fontSize: 20,
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
          ),

          // Products Grid
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.75,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final product = filteredProducts[index];
                  return ProductCard(
                    product: product,
                    onTap: () => _onProductTap(product),
                    onAddToCart: () => _onAddToCart(product),
                  );
                },
                childCount: filteredProducts.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}