// // ignore_for_file: prefer_const_constructors
//
// import 'package:flutter/material.dart';
// import 'package:my_money/pages/login.dart';
// import 'package:my_money/pages/signup/register.dart';
//
// class Authenticate extends StatefulWidget {
//   const Authenticate({super.key});
//
//   @override
//   State<Authenticate> createState() => _AuthenticateState();
// }
//
// class _AuthenticateState extends State<Authenticate> {
//   bool showSignin = true;
//
//   void toggleLoginSignup() {
//     setState(() {
//       showSignin = !showSignin;
//     });
//   }
//   //
//   @override
//   Widget build(BuildContext context) {
//     if (showSignin == true) {
//       return MyLogin(
//         // toggleLoginSignup: toggleLoginSignup,
//       );
//     } else {
//       return MyRegister1(
//         // toggleLoginSignup: toggleLoginSignup,
//       );
//     }
//   }
// }
