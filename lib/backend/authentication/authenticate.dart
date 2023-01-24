import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_money/pages/homepage/nav_tab_page.dart';

import '../../pages/signup/login.dart';

class Authenticate2 extends StatelessWidget {
  const Authenticate2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            } else if (snapshot.hasData) {
              return MainPage();
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Something went wrong.'),
              );
            } else {
              return const MyLogin();
            }
          },
        ),
      );
}
