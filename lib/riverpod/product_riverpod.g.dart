// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_riverpod.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$productsHash() => r'7aef159dd7d6415c6125a031910d62ed4fbb750c';

/// See also [products].
@ProviderFor(products)
final productsProvider = AutoDisposeProvider<List<Product>>.internal(
  products,
  name: r'productsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$productsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ProductsRef = AutoDisposeProviderRef<List<Product>>;
String _$expensiveProductsProviderHash() =>
    r'828ccaab2cd85bfc0caea66be8bdea9d71246bb7';

/// See also [expensiveProducts].
@ProviderFor(expensiveProducts)
final expensiveProductsProvider =
    AutoDisposeProvider<List<Product>>.internal(
  expensiveProducts,
  name: r'expensiveProductsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$expensiveProductsProviderHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ExpensiveProductsProviderRef = AutoDisposeProviderRef<List<Product>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
