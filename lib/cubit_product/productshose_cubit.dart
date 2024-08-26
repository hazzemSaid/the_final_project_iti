import 'package:bloc/bloc.dart';
import 'package:eshop/servies/apicall.dart';
import 'package:eshop/servies/product.dart';
import 'package:meta/meta.dart';

part 'productshose_state.dart';

class ProductshoseCubit extends Cubit<ProductshoseState> {
  ProductshoseCubit() : super(ProductshoseInitial());
  List<Product> favproduct = [];
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

  //get single product py id
  void getSingleProduct(int id) async {
    emit(ProductshoseSingleLoading());
    try {
      final product = await Apicall().getProducts();
      final singleproduct = product.firstWhere((element) => element.id == id);
      emit(ProductshoseSingle(singleproduct));
    } catch (e) {
      emit(ProductshoseSingleError(e.toString()));
    }
  }

  //fav product
  void favProduct(Product item) {
    favproduct.add(item);
  }
}
