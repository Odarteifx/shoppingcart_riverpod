import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoppingcart_riverpod/riverpod/cart_notifier.dart';

class Carts extends ConsumerStatefulWidget {
  const Carts({super.key});

  @override
  ConsumerState<Carts> createState() => _CartsState();
}

class _CartsState extends ConsumerState<Carts> {
  @override
  Widget build(BuildContext context) {
    final expensiveProducts = ref.watch(cartNotifierProvider);
    final cartTotal = ref.watch(cartTotalProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
        actions: [
          expensiveProducts.isNotEmpty
              ? IconButton(
                  onPressed: () {
                    ref.read(cartNotifierProvider.notifier).clearProducts();
                  },
                  icon: const Icon(Iconsax.trash))
              : IconButton(onPressed: () {}, icon: const Icon(Iconsax.add)),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Column(
              children: expensiveProducts.map((product) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .primaryContainer
                            .withOpacity(0.4),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Image.asset(
                          product.image,
                          height: 55,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          product.productname,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600
                          ),
                        ),
                        const Expanded(child: SizedBox()),
                        Column(
                          children: [
                            Text(
                              'GH₵${product.price.toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w500
                              ),
                            ),
                            TextButton(
                                onPressed: () {
                                  ref.read(cartNotifierProvider.notifier).removeProduct(product);
                                },
                                child: const Text(
                                  'Remove',
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
            const Expanded(child: SizedBox()),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'GH₵${cartTotal.toStringAsFixed(2)}',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
