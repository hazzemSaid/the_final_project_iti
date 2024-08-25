import 'package:bloc/bloc.dart';
import 'package:eshop/servies/apicall.dart';
import 'package:eshop/servies/product.dart';
import 'package:meta/meta.dart';
part 'productshose_state.dart';

class ProductshoseCubit extends Cubit<ProductshoseState> {
  ProductshoseCubit() : super(ProductshoseInitial());

  void getProducts() async {
    emit(ProductshoseLoading());
    try {
      final products = await Apicall().getProducts();
      if (products.isEmpty) {
        emit(ProductshoseEmpty());
      } else {
        emit(ProductshoseLoaded(products));
      }
    } catch (e) {
      emit(ProductshoseError(e.toString()));
    }
  }
}
