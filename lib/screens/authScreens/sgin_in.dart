import 'package:eshop/core/widgets/emailtextform.dart';
import 'package:eshop/core/widgets/labeltext.dart';
import 'package:eshop/core/widgets/passwordformtext.dart';
import 'package:eshop/screens/authScreens/sginup.dart';
import 'package:flutter/material.dart';

class SginIn extends StatefulWidget {
  @override
  State<SginIn> createState() => _SginInState();
}

class _SginInState extends State<SginIn> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool seePassword = true;
  String? email;
  String? password;
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
                const SizedBox(
                  width: double.infinity,
                  height: 80,
                ),
                Container(
                  height: 100,
                  child: const Column(
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
                const SizedBox(
                  width: double.infinity,
                  height: 30,
                ),
                Labeltext(text: "Email Address"),
                Tfrom(
                    text: 'email',
                    hint: 'examole@gmail.com',
                    onChanged: (val) {
                      email = val;
                    }),
                const SizedBox(
                  width: double.infinity,
                  height: 10,
                ),
                Labeltext(text: "Password"),
                const SizedBox(
                  width: double.infinity,
                  height: 5,
                ),
                pfrom(
                    onPressed: () {
                      setState(() {
                        seePassword = !seePassword;
                      });
                    },
                    seePassword: seePassword,
                    text: 'password',
                    hint: 'make a strong password',
                    onChanged: (val) {
                      password = val;
                    }),
                const SizedBox(
                  width: double.infinity,
                  height: 50,
                ),
                sginINbutton(
                    formKey: formKey, email: email, password: password),
                const SizedBox(
                  width: double.infinity,
                  height: 10,
                ),
                sginINwithgooglebutton(),
                const SizedBox(
                  width: double.infinity,
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don’t have an account?',
                        style: TextStyle(
                          fontSize: 13,
                          fontFamily: 'AirbnbCereal',
                        )),
                    const SizedBox(
                      width: 5,
                    ),
                    go_sginup(context)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  GestureDetector go_sginup(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SginUp(),
          ),
        );
      },
      child: const Text(
        "Sgin Up for free",
        style: TextStyle(
          color: Color.fromARGB(255, 3, 3, 4),
          fontSize: 13,
          fontWeight: FontWeight.bold,
          fontFamily: 'AirbnbCereal',
        ),
      ),
    );
  }

  InkWell sginINwithgooglebutton() {
    return InkWell(
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
            const SizedBox(
              width: 70,
            ),
            Image.asset(
              'assets/images/google.png',
              width: 30,
              height: 30,
            ),
            const SizedBox(
              width: 15,
            ),
            const Text(
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
    );
  }
}

class sginINbutton extends StatelessWidget {
  const sginINbutton({
    super.key,
    required this.formKey,
    required this.email,
    required this.password,
  });

  final GlobalKey<FormState> formKey;
  final String? email;
  final String? password;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (formKey.currentState!.validate()) {
          if (email != null && password != null) {
            print(email);
            print(password);
          } else {
            // Show error message or handle the null case
            print('Email or password is null');
          }
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
        child: const Text(
          'Sign In', // Corrected the typo
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
