import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shoppingcart_riverpod/data/product_data.dart';
import 'package:shoppingcart_riverpod/models/product_model.dart';

part 'product_riverpod.g.dart';

// final expensiveProductsProvider = Provider((ref){
//   return allProducts.where((p) => p.price > 90).toList();
// });

@riverpod
List<Product> products(ProductsRef ref) {
  return allProducts;
}

@riverpod
List<Product> expensiveProducts(ExpensiveProductsProviderRef ref) {
  return allProducts.where((p) => p.price > 90).toList();
}
