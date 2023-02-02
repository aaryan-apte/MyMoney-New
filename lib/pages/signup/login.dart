// ignore_for_file: prefer_const_constructors

// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:my_money/pages/signup/register.dart';

class MyLogin extends StatefulWidget {

  const MyLogin({Key? key}) : super(key: key);

  @override
  State<MyLogin> createState() => _MyLogin1State();
}

class _MyLogin1State extends State<MyLogin> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final database = FirebaseDatabase.instance;

  // void dispose() {
  //   emailController.dispose();
  //   passwordController.dispose();
  //
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue[100],
        body: SingleChildScrollView(
          padding: EdgeInsets.all(22.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 90,
              ),
              CircleAvatar(
                backgroundColor: Colors.transparent,

                radius: 60.0,
                child: Image.asset('assets/images/logo.jpg'),
              ),
              SizedBox(
                height: 45.0,
              ),
              Text(
                'Save More with MyMoney',
                style: TextStyle(
                  fontFamily: 'CrimsonText',
                  // fontStyle: FontStyle.italic,
                  fontSize: 30.0,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              TextField(
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
                controller: emailController,
                cursorColor: Colors.white,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle:
                        TextStyle(color: Colors.black54, fontSize: 18.0)),
              ),
              SizedBox(
                height: 5,
              ),
              TextField(
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
                controller: passwordController,
                cursorColor: Colors.white,
                textInputAction: TextInputAction.done,
                obscureText: true,
                decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle:
                        TextStyle(color: Colors.black54, fontSize: 18.0)),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 50.0,
                width: 150.0,
                child: ElevatedButton.icon(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.blue[900]),
                  ),
                  onPressed: () {
                    logIn();
                  },
                  icon: Icon(Icons.lock_open_rounded),
                  label: Text(
                    "Sign In",
                    style: TextStyle(
                      fontSize: 24.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'CrimsonText',
                        fontSize: 16),
                    'New to us?  ',
                  ),
                  TextButton(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.black,
                        fontFamily: 'CrimsonText',
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyRegister(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future logIn() async {
    // showDialog(
    //   context: context,
    //   builder: (context) => Center(
    //     child: CircularProgressIndicator(),
    //   ),
    // );

    // final scaffold_key = GlobalKey<ScaffoldMessengerState>();
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    }
  }
}