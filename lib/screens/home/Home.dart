import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> prands = ['nike', 'addidas', 'puma', 'underarmard', 'converse'];

  int? indx;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 251, 250, 250),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 40,
                width: double.infinity,
              ),
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white54,
                    ),
                    margin: EdgeInsets.only(left: 40),
                    child: Icon(Icons.widgets),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Column(
                    children: [
                      Container(
                        child: Text(
                          "Store location",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black38,
                          ),
                        ),
                      ),
                      Container(
                        child: Row(
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
                  SizedBox(
                    width: 60,
                  ),
                  Icon(
                    FontAwesomeIcons.shopify,
                    color: Colors.black,
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                width: 350,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(60),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                padding: EdgeInsets.only(left: 2, right: 5),
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
                        margin: EdgeInsets.only(left: 20),
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                          color:
                              indx == index ? Color(0xff5B9EE1) : Colors.white,
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
              SizedBox(
                height: 50,
              ),
              Padding(
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
              SizedBox(
                height: 20,
              ),
              //list view for popular shoes
              Container(
                padding: EdgeInsets.only(left: 2, right: 5),
                height: 300,
                width: double.infinity,
                //list view for category list horizontal
                child: ListView.builder(
                  // i need if i click in index then the color of the index will be change
                  scrollDirection: Axis.horizontal,
                  itemCount: prands.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          print(index);
                        },
                        child: Container(
                          height: 250,
                          width: 250,
                          color: Colors.white,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Image.asset(
                                'assets/images/item(3).png',
                                height: 150,
                                width: 150,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Align(
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
                                child: Text("Nike Jordan ",
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text("\$200",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black38,
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              //delet
              Padding(
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
                  itemCount: prands.length,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: 10, top: 20, bottom: 20),
                                    alignment: Alignment.topLeft,
                                    child: Text("Best of the year",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'AirbnbCereal',
                                          color: Colors.cyan,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: 10, top: 20, bottom: 20),
                                    alignment: Alignment.topLeft,
                                    child: Text("Nike Air Jordan",
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontFamily: 'AirbnbCereal',
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: 10, top: 20, bottom: 20),
                                    child: Text(
                                      "\$849.69",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontFamily: 'AirbnbCereal',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Image.asset(
                                'assets/images/item(3).png',
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
            ],
          ),
        ));
  }
}
