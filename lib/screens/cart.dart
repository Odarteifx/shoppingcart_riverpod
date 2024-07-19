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
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
        actions: [
          expensiveProducts.isNotEmpty
              ? IconButton(onPressed: () {
                ref.read(cartNotifierProvider.notifier).clearProducts();
              }, icon: const Icon(Iconsax.trash))
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
                          height: 50,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          product.productname,
                          style: const TextStyle(),
                        ),
                        const Expanded(child: SizedBox()),
                        Text('GH₵${product.price.toStringAsFixed(2)}')
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}