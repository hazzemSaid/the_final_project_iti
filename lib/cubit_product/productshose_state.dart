part of 'productshose_cubit.dart';

@immutable
abstract class ProductshoseState {}

class ProductshoseInitial extends ProductshoseState {}

class ProductshoseLoading extends ProductshoseState {}

class ProductshoseLoaded extends ProductshoseState {
  final List<Product> products;
  ProductshoseLoaded(this.products);
}

class ProductshoseError extends ProductshoseState {
  final String message;
  ProductshoseError(this.message);
}

class ProductshoseEmpty extends ProductshoseState {}

class ProductshoseSearch extends ProductshoseState {
  final List<Product> products;
  ProductshoseSearch(this.products);
}

class ProductshoseSingle extends ProductshoseState {
  final Product product;
  ProductshoseSingle(this.product);
}

class ProductshoseSingleError extends ProductshoseState {
  final String message;
  ProductshoseSingleError(this.message);
}

class ProductshoseSingleLoading extends ProductshoseState {}
