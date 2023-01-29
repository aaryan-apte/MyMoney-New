// import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddUser {
  Future<void> addUser() async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    final FirebaseAuth auth = FirebaseAuth.instance;
    // final User userData = auth.currentUser!;
    final String? uid = auth.currentUser?.uid.toString();
    await users.add({"users": uid});
  }
}
