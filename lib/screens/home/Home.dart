import 'dart:math';

import 'package:eshop/cubit_product/productshose_cubit.dart';
import 'package:eshop/screens/detailes/detailes.dart';
import 'package:eshop/servies/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> prands = ['nike', 'addidas', 'puma', 'underarmard', 'converse'];

  int? indx;
  int? indxoficons;
  bool londing = false;

  List<Product> items = List.empty();
  List<Product> fav = List.empty();
  void didChangeDependencies() {
    super.didChangeDependencies();
    fav = BlocProvider.of<ProductshoseCubit>(context).favproduct;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductshoseCubit, ProductshoseState>(
      listener: (context, state) {
        if (state is ProductshoseLoading) {
          londing = true;
        }
        if (state is ProductshoseLoaded) {
          londing = false;
          items = state.products;
        }
        if (state is ProductshoseError) {
          londing = false;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
            backgroundColor: const Color.fromARGB(255, 251, 250, 250),
            body: ModalProgressHUD(
              inAsyncCall: londing,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 40,
                      width: double.infinity,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white54,
                          ),
                          margin: const EdgeInsets.only(left: 40),
                          child: const Icon(Icons.widgets),
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        Column(
                          children: [
                            Container(
                              child: const Text(
                                "Store location",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black38,
                                ),
                              ),
                            ),
                            Container(
                              child: const Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.red,
                                  ),
                                  Text(
                                    "Mondolibug,Sylhet",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 60,
                        ),
                        const Icon(
                          FontAwesomeIcons.shopify,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      width: 350,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search",
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(60),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 2, right: 5),
                      height: 50,
                      width: 500,
                      //list view for category list horizontal
                      child: ListView.builder(
                        // i need if i click in index then the color of the index will be change
                        scrollDirection: Axis.horizontal,
                        itemCount: prands.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              indx = index;
                              setState(() {});
                            },
                            child: Container(
                              margin: const EdgeInsets.only(left: 20),
                              height: 50,
                              width: 100,
                              decoration: BoxDecoration(
                                color: indx == index
                                    ? const Color(0xff5B9EE1)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(60),
                              ),
                              child: Image.asset(
                                'assets/images/${prands[index]}.png',
                                width: 100,
                                height: 50,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Popular Shoes',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'AirbnbCereal',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //list view for popular shoes
                    Container(
                      padding: const EdgeInsets.only(left: 2, right: 5),
                      height: 300,
                      width: double.infinity,
                      //list view for category list horizontal
                      child: ListView.builder(
                        // i need if i click in index then the color of the index will be change
                        scrollDirection: Axis.horizontal,
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Detailes(
                                              item: items[index],
                                            )));
                              },
                              child: Container(
                                height: 300,
                                width: 250,
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Image.network(
                                      items[index].image,
                                      width: 150,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    const Align(
                                      alignment: Alignment.topLeft,
                                      child: Text("Best of the year",
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.cyan,
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(items[index].name,
                                          style: const TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                              items[index].price.toString(),
                                              style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black38,
                                              )),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.only(
                                              left: 50, top: 20, bottom: 20),
                                          child: IconButton(
                                              onPressed: () {
                                                //i need to add the favorite item in the favorite list
                                                //using bloc to do it and if it is already in the favorite list then remove it
                                              },
                                              icon: IconButton(
                                                onPressed: () {
                                                  if (fav
                                                      .contains(items[index])) {
                                                    BlocProvider.of<
                                                                ProductshoseCubit>(
                                                            context)
                                                        .favproduct
                                                        .remove(items[index]);
                                                  } else {
                                                    BlocProvider.of<
                                                                ProductshoseCubit>(
                                                            context)
                                                        .favproduct
                                                        .add(items[index]);
                                                  }

                                                  setState(() {
                                                    fav = BlocProvider.of<
                                                                ProductshoseCubit>(
                                                            context)
                                                        .favproduct;
                                                  });
                                                },
                                                icon: Icon(
                                                  fav.contains(items[index])
                                                      ? Icons.favorite
                                                      : Icons.favorite_border,
                                                  color: Colors.red,
                                                ),
                                              )),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    //delet
                    const Padding(
                      padding: EdgeInsets.only(left: 20, top: 20, bottom: 5),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'New Arrivals',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'AirbnbCereal',
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 2, right: 5),
                      height: 230,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      //list view for category list horizontal
                      child: ListView.builder(
                        // i need if i click in index then the color of the index will be change
                        scrollDirection: Axis.horizontal,
                        itemCount: min(items.length, 9),

                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                print(index);
                              },
                              child: Container(
                                height: 250,
                                width: 380,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                          child: Text(items[index].name,
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
                                            items[index].price.toString(),
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
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    Image.network(
                                      items[index].image,
                                      height: 150,
                                      width: 150,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Stack(
                      children: [
                        Container(
                          color: Colors.white,
                          height: 90,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  FontAwesomeIcons.home,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/fav');
                                },
                                icon: const Icon(
                                  FontAwesomeIcons.heart,
                                ),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  FontAwesomeIcons.bell,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  FontAwesomeIcons.userLarge,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 70,
                          margin: EdgeInsets.only(left: 160, bottom: 0),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(255, 89, 236, 255),
                          ),
                          child: const Icon(
                            Icons.shopping_bag_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
