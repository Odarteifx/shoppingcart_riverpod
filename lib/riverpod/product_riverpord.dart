import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoppingcart_riverpod/data/product_data.dart';

final productsProvder = Provider((ref){
 return allProducts; 
});