import 'package:eshop/cubit_product/productshose_cubit.dart';
import 'package:eshop/core/servies/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Detailes extends StatelessWidget {
  @override
  List sizeShose = ['38', '39', '40', '41', '42', '43', '44', '45'];
  bool loading = false;
  Product item;
  Detailes({required this.item});
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            children: [
              SizedBox(
                width: 60,
              ),
              Container(
                padding: const EdgeInsets.only(right: 100),
                child: Text(
                  'men\'s shoes ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'AirbnbCereal',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                child: Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
        body: BlocConsumer<ProductshoseCubit, ProductshoseState>(
          listener: (context, state) {
            if (state is ProductshoseSingleError) {
              loading = false;
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('error'),
                ),
              );
            }
            if (state is ProductshoseSingleLoading) {
              loading = true;
            }
            if (state is ProductshoseSingle) {
              loading = false;
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
              inAsyncCall: loading,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, bottom: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        item!.image,
                        width: double.infinity,
                        height: 300,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Best Seller",
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.cyan,
                                fontFamily: 'AirbnbCereal',
                              ),
                            ),
                            Text(
                              item!.name,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'AirbnbCereal',
                              ),
                            ),
                            Text(
                              item!.price.toString(),
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              item!.description.substring(0, 100),
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black26,
                                fontFamily: 'AirbnbCereal',
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Gallery",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'AirbnbCereal',
                        ),
                      ),
                      Row(
                        children: [
                          Image.network(
                            item!.image,
                            width: 100,
                            fit: BoxFit.fitWidth,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Image.network(
                            item!.image,
                            width: 100,
                            fit: BoxFit.fitWidth,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Image.network(
                            item!.image,
                            width: 100,
                            fit: BoxFit.fitWidth,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(""),
                          Container(
                            width: 150,
                            padding: const EdgeInsets.only(left: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("EU"),
                                Text("EG"),
                                Text("DR"),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text('size'),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 50,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: sizeShose.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.only(right: 10),
                              alignment: Alignment.center,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 218, 226, 234),
                                shape: BoxShape.circle,
                              ),
                              child: Text(sizeShose[index]),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text('price'),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${item!.price}',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.only(right: 20),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 91, 158, 225),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Text(
                              'Add to cart',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
