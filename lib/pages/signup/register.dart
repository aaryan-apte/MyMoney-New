// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
// import 'package:my_money/backend/services/auth.dart';
// import 'package:my_money/pages/signup/login.dart';
// import 'package:my_money/pages/signup/input.dart';

class MyRegister extends StatefulWidget {
  // final VoidCallback onClickedSignIn;
  const MyRegister({super.key});

  @override
  _MyRegisterState createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {

  final database = FirebaseDatabase.instance;

  // final AuthService _auth = AuthService();
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  DatabaseReference ref = FirebaseDatabase.instance.ref();

  // void dispose() {
  //   emailController.dispose();
  //   passwordController.dispose();
  //
  //   super.dispose();
  // }

  Future signUp() async {
    // BuildContext dialogContext;

    final isValid = formKey.currentState!.validate();
    if(isValid == false){
      return;
    }

    // showDialog(
    //   context: context,
    //   barrierDismissible: false,
    //   builder: (context) => Center(
    //     child: CircularProgressIndicator(),
    //   ),
    // );
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
      // showSnackBar(e.message);
    }
    // Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.cyan[900],
        body: SingleChildScrollView(
          padding: EdgeInsets.all(22.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 70,
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
                  height: 25.0,
                ),
                TextFormField(
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                  controller: nameController,
                  cursorColor: Colors.white,
                  textInputAction: TextInputAction.done,
                  // obscureText: true,
                  // autovalidateMode: AutovalidateMode.onUserInteraction,
                  // validator: (value) => value != null && value.length < 6
                  //     ? "Enter minimum 6 characters"
                  //     : null,
                  decoration: InputDecoration(
                    labelText: "Name",
                    labelStyle: TextStyle(color: Colors.white38, fontSize: 18.0),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                  controller: emailController,
                  cursorColor: Colors.white,
                  textInputAction: TextInputAction.next,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (email) =>
                      email != null && !EmailValidator.validate(email, true)
                          ? "Enter a valid email"
                          : null,
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(color: Colors.white38, fontSize: 18.0),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                  controller: passwordController,
                  cursorColor: Colors.white,
                  textInputAction: TextInputAction.done,
                  obscureText: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => value != null && value.length < 6
                      ? "Enter minimum 6 characters"
                      : null,
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: TextStyle(color: Colors.white38, fontSize: 18.0),
                  ),
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
                      signUp();
                    },
                    icon: Icon(Icons.lock_open_rounded),
                    label: Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 24.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 17.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'CrimsonText',
                          fontSize: 16),
                      'Already have an account?   ',
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Log In',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.white,
                          fontFamily: 'CrimsonText',
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // decoration: BoxDecoration(
//       //   image: DecorationImage(
//       //       image: AssetImage('assets/images/blue_bg.jpeg'), fit: BoxFit.cover),
//       // ),
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//         ),
//         body: Stack(
//           children: [
//             Container(
//               padding: EdgeInsets.only(left: 35, top: 30),
//               child: Text(
//                 'Create\nAccount',
//                 style: TextStyle(color: Colors.white, fontSize: 33),
//               ),
//             ),
//             SingleChildScrollView(
//               child: Form(
//                 key: _formKey,
//                 child: Container(
//                   padding: EdgeInsets.only(
//                       top: MediaQuery.of(context).size.height * 0.28),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                         margin: EdgeInsets.only(left: 35, right: 35),
//                         child: Column(
//                           children: [
//                             TextFormField(
//                               style: TextStyle(color: Colors.white),
//                               decoration: InputDecoration(
//                                 enabledBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                   borderSide: BorderSide(
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                   borderSide: BorderSide(
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                                 hintText: "Name",
//                                 hintStyle: TextStyle(color: Colors.white),
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                               ),
//                               validator: (val) =>
//                               val!.isEmpty ? "Enter your name" : null,
//                               controller: nameController,
//                             ),
//                             SizedBox(
//                               height: 30,
//                             ),
//                             TextField(
//                               style: TextStyle(color: Colors.white),
//                               decoration: InputDecoration(
//                                 enabledBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                   borderSide: BorderSide(
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                   borderSide: BorderSide(
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                                 hintText: "Email",
//                                 hintStyle: TextStyle(color: Colors.white),
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                               ),
//                               controller: emailController,
//                             ),
//                             SizedBox(
//                               height: 30,
//                             ),
//                             TextFormField(
//                               style: TextStyle(color: Colors.white),
//                               obscureText: true,
//                               decoration: InputDecoration(
//                                 enabledBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                   borderSide: BorderSide(
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                   borderSide: BorderSide(
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                                 hintText: "Password",
//                                 hintStyle: TextStyle(color: Colors.white),
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                               ),
//                               controller: passwordController,
//                             ),
//                             SizedBox(
//                               height: 40,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   'Register',
//                                   style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 27,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                                 CircleAvatar(
//                                   radius: 30,
//                                   backgroundColor: Color(0xff4c505b),
//                                   child: IconButton(
//                                     color: Colors.white,
//                                     onPressed: () async {
//                                       // if (!_formKey.currentState!
//                                       //     .validate()) {
//                                       //   print(email);
//                                       //   print(password);
//                                       // }
//                                       signUp();
//                                       Navigator.pushNamed(context, 'input');
//                                     },
//                                     icon: Icon(
//                                       Icons.arrow_forward,
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                             SizedBox(
//                               height: 40,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 TextButton(
//                                   onPressed: () {
//                                     // Navigator.pushNamed(context, 'login');
//                                     MyLogin(onclickedSignup: toggle,);
//                                   },
//                                   child: Text(
//                                     'Sign In',
//                                     textAlign: TextAlign.left,
//                                     style: TextStyle(
//                                         decoration: TextDecoration.underline,
//                                         color: Colors.white,
//                                         fontSize: 18),
//                                   ),
//                                   style: ButtonStyle(),
//                                 ),
//                               ],
//                             )
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
