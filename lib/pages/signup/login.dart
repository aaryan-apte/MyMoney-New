// ignore_for_file: prefer_const_constructors

// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_money/pages/signup/register.dart';
// import 'package:my_money/main.dart';

class MyLogin extends StatefulWidget {
  // final VoidCallback onclickedSignup;

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
        backgroundColor: Colors.cyan[900],
        body: SingleChildScrollView(
          padding: EdgeInsets.all(22.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 90,
              ),
              CircleAvatar(
                radius: 60.0,
                child: Image.asset('assets/images/mymoney_logo.png'),
              ),
              SizedBox(
                height: 45.0,
              ),
              Text(
                'Welcome to MyMoney',
                style: TextStyle(
                  fontFamily: 'CrimsonText',
                  // fontStyle: FontStyle.italic,
                  fontSize: 30.0,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              TextField(
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
                controller: emailController,
                cursorColor: Colors.white,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle:
                        TextStyle(color: Colors.white38, fontSize: 18.0)),
              ),
              SizedBox(
                height: 5,
              ),
              TextField(
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
                controller: passwordController,
                cursorColor: Colors.white,
                textInputAction: TextInputAction.done,
                obscureText: true,
                decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle:
                        TextStyle(color: Colors.white38, fontSize: 18.0)),
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
                        MaterialStateProperty.all(Colors.lightGreen[600]),
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
              GestureDetector(
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(color: Colors.white, fontSize: 15.0),
                ),
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPasswordPage()));
                },
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'CrimsonText',
                        fontSize: 16),
                    'New to us?  ',
                  ),
                  TextButton(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.white,
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
//
// class MyLogin1 extends StatefulWidget {
//   // MyLogin({required this.toggleLoginSignup});
//   // final Function toggleLoginSignup;
//
//   late final VoidCallback onclickedSignup;
//
//   @override
//   _MyLogin1State createState() => _MyLogin1State();
// }
//
// class _MyLoginState extends State<MyLogin1> {
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//
//   void dispose() {
//     emailController.dispose();
//     passwordController.dispose();
//
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.blue, // Change
//         body: Stack(
//           children: [
//             Container(),
//             Container(
//               padding: const EdgeInsets.only(left: 35, top: 130),
//               child: const Text(
//                 'Welcome\nBack',
//                 style: TextStyle(color: Colors.white, fontSize: 33),
//               ),
//             ),
//             SingleChildScrollView(
//               child: Container(
//                 padding: EdgeInsets.only(
//                     top: MediaQuery.of(context).size.height * 0.5),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       margin: const EdgeInsets.only(left: 35, right: 35),
//                       child: Column(
//                         children: [
//                           TextField(
//                             controller: emailController,
//                             style: const TextStyle(color: Colors.black),
//                             decoration: InputDecoration(
//                               fillColor: Colors.grey.shade100,
//                               filled: true,
//                               hintText: "Email",
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(14),
//                               ),
//                             ),
//                             // onChanged: (val) {
//                             //   setState(() {
//                             //     email = val;
//                             //   });
//                             // },
//                           ),
//                           const SizedBox(
//                             height: 30,
//                           ),
//                           TextField(
//                             controller: passwordController,
//                             style: const TextStyle(),
//                             obscureText: true,
//                             decoration: InputDecoration(
//                               fillColor: Colors.grey.shade100,
//                               filled: true,
//                               hintText: "Password",
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(14),
//                               ),
//                             ),
//                             // onChanged: (val) {
//                             //   setState(() {
//                             //     password = val;
//                             //   });
//                             // },
//                           ),
//                           const SizedBox(
//                             height: 40,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               const Text(
//                                 'Sign In',
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 27,
//                                     fontWeight: FontWeight.w700),
//                               ),
//                               CircleAvatar(
//                                 radius: 30,
//                                 backgroundColor: const Color(0xff4c505b),
//                                 child: IconButton(
//                                   color: Colors.white,
//                                   onPressed: () {
//                                     // Navigator.pushNamed(context, 'homepage');
//                                     //print("Email: $email");
//                                     //print("Password: $password");
//                                     signIn();
//                                   },
//                                   icon: const Icon(
//                                     Icons.arrow_forward,
//                                   ),
//                                 ),
//                               )
//                             ],
//                           ),
//                           const SizedBox(
//                             height: 40,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               TextButton(
//                                 onPressed: () {
//                                   Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) => MyRegister()));
//                                   // widget.toggleLoginSignup();
//                                 },
//                                 style: const ButtonStyle(),
//                                 child: Text(
//                                   'Sign Up',
//                                   textAlign: TextAlign.left,
//                                   style: TextStyle(
//                                       decoration: TextDecoration.underline,
//                                       color: Color(0xff4c505b),
//                                       fontSize: 18),
//                                 ),
//                               ),
//                               TextButton(
//                                 onPressed: () {},
//                                 child: const Text(
//                                   'Forgot Password',
//                                   style: TextStyle(
//                                     decoration: TextDecoration.underline,
//                                     color: Color(0xff4c505b),
//                                     fontSize: 18,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           )
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Future signIn() async {
//     showDialog(
//       context: context,
//       builder: (context) => Center(
//         child: CircularProgressIndicator(),
//       ),
//     );
//
//     try {
//       await FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: emailController.text.trim(),
//         password: passwordController.text.trim(),
//       );
//     } on FirebaseAuthException catch (e) {
//       print(e);
//     }
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:my_money/pages/signup/register.dart';
// import 'package:my_money/pages/homepage/home_page.dart';

// class MyLogin extends StatefulWidget {
//   const MyLogin({Key? key}) : super(key: key);

//   @override
//   _MyLoginState createState() => _MyLoginState();
// }

// class _MyLoginState extends State<MyLogin> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//         //image: DecorationImage(
//           //  image: AssetImage('android/assets/11.png'), fit: BoxFit.cover),
//       ),
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         body: Stack(
//           children: [
//             Container(),
//             Container(
//               padding: const EdgeInsets.only(left: 35, top: 130),
//               child: const Text(
//                 'Welcome\nBack',
//                 style: TextStyle(color: Colors.white, fontSize: 33),
//               ),
//             ),
//             SingleChildScrollView(
//               child: Container(
//                 padding: EdgeInsets.only(
//                     top: MediaQuery.of(context).size.height * 0.5),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       margin: const EdgeInsets.only(left: 35, right: 35),
//                       child: Column(
//                         children: [
//                           TextField(
//                             style: const TextStyle(color: Colors.black),
//                             decoration: InputDecoration(
//                                 fillColor: Colors.grey.shade100,
//                                 filled: true,
//                                 hintText: "Email",
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                 )),
//                           ),
//                           const SizedBox(
//                             height: 30,
//                           ),
//                           TextField(
//                             style: const TextStyle(),
//                             obscureText: true,
//                             decoration: InputDecoration(
//                                 fillColor: Colors.grey.shade100,
//                                 filled: true,
//                                 hintText: "Password",
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                              ),
//                           ),
//                           const SizedBox(
//                             height: 40,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                                Text(
//                                 'Sign In',
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 27,
//                                     fontWeight: FontWeight.w700),
//                                ),
//                               CircleAvatar(
//                                 radius: 30,
//                                 backgroundColor: const Color(0xff4c505b),
//                                 child: IconButton(
//                                     color: Colors.white,
//                                     onPressed: () {
//                                       Navigator.pushNamed(context, 'home_page');
//                                     },
//                                     icon: const Icon(
//                                       Icons.arrow_forward,
//                                     )),
//                               )
//                             ],
//                           ),
//                           const SizedBox(
//                             height: 40,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               TextButton(
//                                 onPressed: () {
//                                   Navigator.pushNamed(context, 'register');
//                                 },
//                                 child: Text(
//                                   'Sign Up',
//                                   textAlign: TextAlign.left,
//                                   style: TextStyle(
//                                       decoration: TextDecoration.underline,
//                                       color: Color(0xff4c505b),
//                                       fontSize: 18),
//                                 ),
//                                 style: const ButtonStyle(),
//                               ),
//                               TextButton(
//                                   onPressed: () {},
//                                   child: const Text(
//                                     'Forgot Password',
//                                     style: TextStyle(
//                                       decoration: TextDecoration.underline,
//                                       color: Color(0xff4c505b),
//                                       fontSize: 18,
//                                     ),
//                                   )),
//                             ],
//                           )
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
