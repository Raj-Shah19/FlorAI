import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<void> storeUserData(User user) async {

  try {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    DocumentSnapshot userDoc = await users.doc(user.uid).get();

    if (userDoc.exists) {
      debugPrint("User already exists. No need to store data again.");
    } else {
      await users.doc(user.uid).set({
        'uid': user.uid,
        'email': user.email ?? '',
        'phoneNumber': user.phoneNumber ?? '',
        'displayName': user.displayName ?? 'Unknown',
        'photoURL': user.photoURL ?? '',
        'lastSignInTime': user.metadata.lastSignInTime?.toIso8601String(),
        'creationTime': user.metadata.creationTime?.toIso8601String(),
      });

      debugPrint("User data stored successfully!");
    }
  } catch (e) {
    debugPrint("Failed to store user data: $e");
  }
}
