import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{

    final FirebaseAuth _auth = FirebaseAuth.instance;
    // Anonymous
    Future SignInAnonymous() async {
        try{
            AuthResult result = await _auth.signInAnonymously();
            // Await karan thambava lagta hoi paryanta
            FirebaseUser user = result.user;
            return user;

        } catch (e) {
            print(e.toString());
            return null;
        }
    }
    // Signin email pass

    // register email pass

    // sign out
}           