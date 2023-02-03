import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LogOut extends StatefulWidget {
  const LogOut({Key? key}) : super(key: key);

  @override
  State<LogOut> createState() => _LogOutState();
}

class _LogOutState extends State<LogOut> {

  Future<void> logOut() async{
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Center(child: const Text("MyMoney", style: TextStyle(color: Colors.white, fontSize: 28.0, fontWeight: FontWeight.w700),)),
      ),
      body: Container(
        color: Colors.blue[100],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Be back soon!",
                style: TextStyle(fontSize: 25.0),
              ),
              const SizedBox(height: 20.0),
              TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.blue[900]),
                onPressed: () {
                  logOut();
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Log Out",
                    style: TextStyle(fontSize: 23.0, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
