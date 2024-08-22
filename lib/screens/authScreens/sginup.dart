import 'package:eshop/core/widgets/emailtextform.dart';
import 'package:eshop/core/widgets/labeltext.dart';
import 'package:eshop/core/widgets/passwordformtext.dart';
import 'package:eshop/core/widgets/sginINwithgoogle.dart';
import 'package:eshop/cubit/auth_cubit.dart';
import 'package:eshop/screens/home/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SginUp extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool seePassword = true;
  String? email;
  String? name;
  String? password;
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SginUpLoading) {
          loading = true;
        } else if (state is SginUpSuccess) {
          loading = false;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (constex) => Home(),
            ),
          );
        } else if (state is SginUpFailed) {
          loading = false;
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('SginUp Failed'),
            ),
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: loading,
          child: Scaffold(
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
                              "Create Account!",
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
                              'Let’s Create Account Together',
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
                        height: 10,
                      ),
                      Labeltext(text: "Your Name"),
                      Tfrom(
                          text: 'Your Name',
                          hint: 'Hazem',
                          onChanged: (val) {
                            name = val;
                          }),
                      const SizedBox(
                        width: double.infinity,
                        height: 20,
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
                        height: 20,
                      ),
                      Labeltext(text: "Password"),
                      const SizedBox(
                        width: double.infinity,
                        height: 5,
                      ),
                      pfrom(
                          onPressed: () {},
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
                      InkWell(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            if (email != null && password != null) {
                              print('Email: $email');
                              print('Password: $password');
                              BlocProvider.of<AuthCubit>(context)
                                  .sginupwithemail(
                                emailAddress: email!,
                                password: password!,
                              );
                            } else {
                              // Show error message or handle the null case
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Email or password is null'),
                                ),
                              );
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
                      ),
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
          ),
        );
      },
    );
  }

  GestureDetector go_sginup(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("sgin up");
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
}
