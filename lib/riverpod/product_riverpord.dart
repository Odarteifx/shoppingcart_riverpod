import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoppingcart_riverpod/data/product_data.dart';

final productsProvder = Provider((ref){
 return allProducts; 
});

final expeonsiveProducts = Provider((ref){
  return allProducts.where((p) => p.price > 90).toList();
});