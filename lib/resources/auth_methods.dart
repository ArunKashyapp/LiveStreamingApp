import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:livestreaming/models/user_model.dart' as model;
import 'package:livestreaming/providers/user_providers.dart';
import 'package:livestreaming/utils/util.dart';
import 'package:provider/provider.dart';

class AuthMethods {
  final _userRef = FirebaseFirestore.instance.collection('users');
  final _auth = FirebaseAuth.instance;

  Future<bool> signUp(BuildContext context, String email, String userName,
      String password) async {
    bool res = false;
    try {
      UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (cred.user != null) {
        model.User user = model.User(
          uid: cred.user!.uid,
          userName: userName.trim(),
          email: email.trim(),
        );

        await _userRef.doc(cred.user!.uid).set(user.toMap());

        () {
          Provider.of<UserProvider>(context, listen: false).setUser(user);
        }();
        res = true;
      }
    } on FirebaseAuthException catch (e) {
      //This is basically immediately invoked function expression IIFE
      // No name function in dart (){}
      () {
        showSnackBar(context, e.message!);
      }();
    }
    return res;
  }
}

void handleFirebaseAuthError(BuildContext context, FirebaseAuthException e) {
  showSnackBar(context, e.message!);
}
