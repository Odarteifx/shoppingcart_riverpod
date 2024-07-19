import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shoppingcart_riverpod/models/product_model.dart';
part 'cart_notifier.g.dart';

@riverpod
class CartNotifier extends _$CartNotifier {
  @override
  Set<Product> build() {
    return {};
  }

  void addProduct(Product product) {
    if (!state.contains(product)) {
      state = {...state, product};
    }
  }

  void removeProduct(Product product) {
    if (state.contains(product)) {
      state = state.where((p) => p.id != product.id).toSet();
    }
  }

  void clearProducts(){
   state = {};
  }
}

@riverpod
double cartTotal(ref){
  final cartProducts = ref.watch(cartNotifierProvider);

  double total = 0 ;

  for (Product product in cartProducts) {
    total += product.price;  
  }
    return total;
}