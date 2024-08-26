import 'package:eshop/cubit_product/productshose_cubit.dart';
import 'package:eshop/servies/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Favscreen extends StatefulWidget {
  const Favscreen({super.key});

  @override
  State<Favscreen> createState() => _FavscreenState();
}

class _FavscreenState extends State<Favscreen> {
  List<Product> fav = [];
  void didChangeDependencies() {
    super.didChangeDependencies();
    fav = BlocProvider.of<ProductshoseCubit>(context).favproduct;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 60),
          child: Text('Favorite Shoes'),
        ),
      ),
      body: ListView.builder(
        itemCount: fav.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                child: Container(
              height: 250,
              width: 380,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                            left: 10, top: 20, bottom: 20),
                        alignment: Alignment.topLeft,
                        child: const Text("Best of the year",
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'AirbnbCereal',
                              color: Colors.cyan,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            left: 10, top: 20, bottom: 20),
                        alignment: Alignment.topLeft,
                        child: Text(fav[index].name,
                            style: TextStyle(
                              fontSize: 25,
                              fontFamily: 'AirbnbCereal',
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            left: 10, top: 20, bottom: 20),
                        child: Text(
                          fav[index].price.toString(),
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontFamily: 'AirbnbCereal',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 50, bottom: 20),
                    child: Image.network(
                      fav[index].image,
                      width: 200,
                      height: 200,
                    ),
                  ),
                ],
              ),
            )),
          );
        },
      ),
    );
  }
}
/*ListTile(
            title: Text(fav[index].name),
            subtitle: Text(fav[index].price.toString()),
            leading: Image.network(fav[index].image),
          );*/