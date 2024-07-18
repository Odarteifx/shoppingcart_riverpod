import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoppingcart_riverpod/riverpod/product_riverpord.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      home: const FoodPage(),
    );
  }
}

class FoodPage extends ConsumerWidget {
  const FoodPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allProducts = ref.watch(productsProvder);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Best Pick'),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Badge(child: Icon(Iconsax.shopping_bag4)))
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: allProducts.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 0.8,
        ),
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withOpacity(0.2),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Image.asset(
                      height: 120,
                      allProducts[index].image,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      allProducts[index].productname,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text('GH₵${allProducts[index].price.toStringAsFixed(2)}')
                  ],
                ),
              ),
              Positioned(
                top: 165,
                left: 125,
                  child: Center(
                    child: IconButton.filled(
                      padding: const EdgeInsets.all(1),
                      visualDensity: const VisualDensity(horizontal: -2.5, vertical: -2.5),
                        onPressed: () {}, icon: const Icon(
                          Iconsax.shopping_bag,
                          size: 15,
                          )),
                  ))
            ],
          );
        },
      ),
    );
  }
}
