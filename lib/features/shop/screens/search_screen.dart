import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../data/products.dart';
import '../../authentication/models/product.dart';
import 'product_screen.dart';
import '../../../common/widgets/product_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Product> _searchResults = [];
  bool _isSearching = false;

  void _performSearch(String query) {
    setState(() {
      _isSearching = query.isNotEmpty;
      _searchResults = ProductsData.searchProducts(query);
    });
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            controller: _searchController,
            onChanged: _performSearch,
            decoration: InputDecoration(
              hintText: 'Search products...',
              hintStyle: GoogleFonts.poppins(color: Colors.grey.shade500),
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search, color: Colors.grey.shade500),
              suffixIcon: _searchController.text.isNotEmpty
                  ? IconButton(
                      icon: Icon(Icons.clear, color: Colors.grey.shade500),
                      onPressed: () {
                        _searchController.clear();
                        _performSearch('');
                      },
                    )
                  : null,
            ),
          ),
        ),
      ),
      body: _isSearching
          ? _searchResults.isNotEmpty
              ? GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: _searchResults.length,
                  itemBuilder: (context, index) {
                    final product = _searchResults[index];
                    return ProductCard(
                      product: product,
                      onTap: () => _onProductTap(product),
                      onAddToCart: () => _onAddToCart(product),
                    );
                  },
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.search_off,
                        size: 80,
                        color: Colors.grey.shade300,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'No products found',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Try different keywords',
                        style: GoogleFonts.poppins(
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                )
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Text(
                  'Popular Searches',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    'Headphones',
                    'Watch',
                    'T-Shirt',
                    'Fitness',
                    'Backpack',
                    'Electronics',
                    'Accessories',
                  ].map((tag) {
                    return ActionChip(
                      label: Text(tag),
                      onPressed: () {
                        _searchController.text = tag;
                        _performSearch(tag);
                      },
                      backgroundColor: Colors.grey.shade100,
                    );
                  }).toList(),
                ),
              ],
            ),
    );
  }
}