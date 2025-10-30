import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> storeUserData(User user) async {
  try {
    // Create a reference to the Firestore collection
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    // Check if the document for this user already exists
    DocumentSnapshot userDoc = await users.doc(user.uid).get();

    if (userDoc.exists) {
      // User already exists, no need to add data again
      print("User already exists. No need to store data again.");
    } else {
      // User does not exist, create new document
      await users.doc(user.uid).set({
        'uid': user.uid,
        'email': user.email ?? '',
        'phoneNumber': user.phoneNumber ?? '',
        'displayName': user.displayName ?? 'Unknown',
        'photoURL': user.photoURL ?? '',
        'lastSignInTime': user.metadata.lastSignInTime?.toIso8601String(),
        'creationTime': user.metadata.creationTime?.toIso8601String(),
      });

      print("User data stored successfully!");
    }
  } catch (e) {
    print("Failed to store user data: $e");
  }
}
