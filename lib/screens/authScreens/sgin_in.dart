import 'package:eshop/screens/authScreens/sginup.dart';
import 'package:flutter/material.dart';

class SginIn extends StatefulWidget {
  @override
  State<SginIn> createState() => _SginInState();
}

class _SginInState extends State<SginIn> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool seePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 80,
                ),
                Container(
                  height: 100,
                  child: Column(
                    children: [
                      Text(
                        "Hello again!",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          fontFamily: 'AirbnbCereal',
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Welcome Back You’ve Been Missed!",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black26,
                          fontFamily: 'AirbnbCereal',
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 30,
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 4,
                          bottom: 10,
                        ),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Email Address',
                            style: TextStyle(
                              fontFamily: 'AirbnbCereal',
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      TextFormField(
                        cursorColor: Colors.green,
                        cursorErrorColor: Colors.green,
                        decoration: InputDecoration(
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          labelText: ' example@gmail.com',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 10,
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 4,
                          bottom: 10,
                        ),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'password',
                            style: TextStyle(
                              fontFamily: 'AirbnbCereal',
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 5,
                      ),
                      TextFormField(
                        cursorColor: Colors.green,
                        cursorErrorColor: Colors.green,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () {
                                seePassword = !seePassword;
                                setState(() {});
                              },
                              icon: Icon(Icons.remove_red_eye)),

                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          labelText: 'password',
                          // This hides the text
                        ),
                        obscureText: seePassword,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                      ),
                      InkWell(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SginUp(),
                              ),
                            );
                          }
                        },
                        child: Container(
                          height: 70,
                          width: 380,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: const Color(0xFF5B9EE1),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            'Sgin In',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          print("sgin in with google");
                        },
                        child: Container(
                          height: 70,
                          width: 380,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: const Color.fromARGB(255, 228, 226, 226),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 70,
                              ),
                              Image.asset(
                                'assets/images/google.png',
                                width: 30,
                                height: 30,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                'Sgin In with google',
                                style: TextStyle(
                                  color: Color(0xfF1A2530),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'AirbnbCereal',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don’t have an account?',
                              style: TextStyle(
                                fontSize: 13,
                                fontFamily: 'AirbnbCereal',
                              )),
                          SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SginUp(),
                                ),
                              );
                            },
                            child: Text(
                              "Sgin Up for free",
                              style: TextStyle(
                                color: Color.fromARGB(255, 3, 3, 4),
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'AirbnbCereal',
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
