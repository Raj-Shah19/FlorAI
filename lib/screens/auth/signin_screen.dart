// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:florai/screens/splash/splash_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import '../../utils/theme/app_colors.dart';
// import '../../utils/theme/app_theme.dart';
//
// class SignInScreen extends StatefulWidget {
//   @override
//   _SignInScreenState createState() => _SignInScreenState();
// }
//
// class _SignInScreenState extends State<SignInScreen> {
//
//   static final GoogleSignIn _googleSignIn = GoogleSignIn(
//     scopes: <String>[
//       'email',
//     ],
//   );
//   static final firebaseAuth = FirebaseAuth.instance;
//   User? get currentUser => firebaseAuth.currentUser;
//
//   Future<UserCredential?> signInWithGoogle() async {
//     final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
//     if (googleUser == null) {
//       return null;
//     }
//     final GoogleSignInAuthentication googleAuth =
//     await googleUser.authentication;
//
//     final AuthCredential credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth.accessToken,
//       idToken: googleAuth.idToken,
//     );
//
//     final UserCredential authResult =
//     await firebaseAuth.signInWithCredential(credential);
//     return authResult;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.background,
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Text(
//                 'FlorAI',
//                 style: Theme.of(context).textTheme.headlineLarge?.copyWith(
//                   color: AppColors.textPrimary,
//                 ),
//               ),
//               const SizedBox(height: 30),
//               // Username/Email Input
//               TextField(
//                 style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                   color: AppColors.textPrimary,
//                 ),
//                 decoration: InputDecoration(
//                   hintText: 'Email',
//                   hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                     color: AppColors.textDisabled,
//                   ),
//                   filled: true,
//                   fillColor: AppColors.surface,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: BorderSide.none,
//                   ),
//                   contentPadding: const EdgeInsets.symmetric(
//                       horizontal: 20, vertical: 15),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               // Password Input
//               TextField(
//                 obscureText: true,
//                 style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                   color: AppColors.textPrimary,
//                 ),
//                 decoration: InputDecoration(
//                   hintText: 'Password',
//                   hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                     color: AppColors.textDisabled,
//                   ),
//                   filled: true,
//                   fillColor: AppColors.surface,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: BorderSide.none,
//                   ),
//                   contentPadding: const EdgeInsets.symmetric(
//                       horizontal: 20, vertical: 15),
//                 ),
//               ),
//               const SizedBox(height: 30),
//               // Sign In Button
//               ElevatedButton(
//                 style: AppTheme.primaryButtonStyle(),
//                 onPressed: () {
//                   // Handle Sign In
//                 },
//                 child: Text(
//                   'Sign In',
//                   style: Theme.of(context).textTheme.labelLarge?.copyWith(
//                     color: AppColors.textOnPrimary,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               // Google Sign-in Button
//               ElevatedButton(
//                 onPressed: () async {
//                   final user = await signInWithGoogle();
//                   if (user != null && user.user != null) {
//                     print("RAJ USER - ${user.user}");
//                   } else {
//                     if (mounted) {
//                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                         content: const Text("Unable to Sign-in with Google"),
//                         backgroundColor: AppColors.error,
//                       ));
//                     }
//                   }
//                 },
//                 style: ElevatedButton.styleFrom(
//                   elevation: 0,
//                   backgroundColor: AppColors.surface,
//                   shape: RoundedRectangleBorder(
//                     side: BorderSide(
//                         color: AppColors.border,
//                         width: 1),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   padding: const EdgeInsets.symmetric(
//                       vertical: 15,
//                       horizontal: 20),
//                   maximumSize: const Size(double.infinity, 56),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Image.asset(
//                       "assets/images/google_logo.png",
//                       fit: BoxFit.contain,
//                       errorBuilder: (context, error, stackTrace) {
//                         return Icon(
//                           Icons.login,
//                           size: 30,
//                           color: AppColors.primary,
//                         );
//                       },
//                     ),
//                     const SizedBox(width: 10), // add spacing between icon and text
//                     Text(
//                       'Continue with Google',
//                       style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                         color: AppColors.textPrimary,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               // Sign Up Prompt (Link)
//               TextButton(
//                 onPressed: () {
//                   // Handle Sign Up
//                 },
//                 child: Text(
//                   'Don’t have an account? Sign Up',
//                   style: Theme.of(context).textTheme.labelMedium?.copyWith(
//                     color: AppColors.textSecondary,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:florai/screens/auth/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../services/firestore_db.dart';
import '../../utils/theme/app_colors.dart';
import '../../utils/theme/app_theme.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  static final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
    ],
  );
  static final firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => firebaseAuth.currentUser;

  // final TextEditingController _phoneController = TextEditingController();
  // final TextEditingController _smsController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Initialize phoneClicked as a state variable
  // bool phoneClicked = false;
  // bool codeSent = false; // Add this new state variable
  // String verificationId = '';

  Future<UserCredential?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser == null) {
      return null;
    }
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final UserCredential authResult =
        await firebaseAuth.signInWithCredential(credential);

    if (authResult.user != null) {
      await storeUserData(authResult.user!); // Store user data in Firestore
      print("User signed in with Google: ${authResult.user!.email}");
    }
    return authResult;
  }

  // Future<void> _verifyPhoneNumber() async {
  //   await firebaseAuth.verifyPhoneNumber(
  //     phoneNumber: _phoneController.text,
  //     verificationCompleted: (PhoneAuthCredential credential) async {
  //       UserCredential userCredential =
  //           await firebaseAuth.signInWithCredential(credential);
  //       if (userCredential.user != null) {
  //         print("User signed in: ${userCredential.user!.phoneNumber}");
  //       }
  //     },
  //     verificationFailed: (FirebaseAuthException e) {
  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //         content: Text("Phone verification failed: ${e.message}"),
  //         backgroundColor: AppColors.error,
  //       ));
  //     },
  //     codeSent: (String verificationId, int? resendToken) {
  //       setState(() {
  //         this.verificationId = verificationId;
  //         codeSent =
  //             true; // Set codeSent to true when verification code is sent
  //       });
  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //         content: const Text("Verification code sent!"),
  //         backgroundColor: AppColors.primary,
  //       ));
  //     },
  //     codeAutoRetrievalTimeout: (String verificationId) {
  //       this.verificationId = verificationId;
  //     },
  //   );
  // }

  // Future<void> _signInWithPhoneNumber() async {
  //   PhoneAuthCredential credential = PhoneAuthProvider.credential(
  //     verificationId: verificationId,
  //     smsCode: _smsController.text,
  //   );

  //   UserCredential userCredential =
  //       await firebaseAuth.signInWithCredential(credential);
  //   if (userCredential.user != null) {
  //     await storeUserData(userCredential.user!); // Store user data in Firestore
  //     print(
  //         "User signed in with phone number: ${userCredential.user!.phoneNumber}");
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //       content: const Text("Failed to sign in with phone number"),
  //       backgroundColor: AppColors.error,
  //     ));
  //   }
  // }

  Future<void> _signInWithEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        await storeUserData(
            userCredential.user!); // Store user data in Firestore
        print("User signed in with email: ${userCredential.user!.email}");
      }
    } catch (e) {
      print("Error signing in with email/password: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Sign In',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: AppColors.textPrimary,
                    ),
              ),
              const SizedBox(height: 30),

              // Conditional rendering based on phoneClicked
              // if (!phoneClicked) ...[
                // Email/Password Login Section
                TextField(
                  controller: _emailController,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppColors.textPrimary,
                      ),
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppColors.textDisabled,
                        ),
                    filled: true,
                    fillColor: AppColors.surface,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppColors.textPrimary,
                      ),
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppColors.textDisabled,
                        ),
                    filled: true,
                    fillColor: AppColors.surface,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  style: AppTheme.primaryButtonStyle(),
                  onPressed: () {
                    // Handle Email Sign In
                    _signInWithEmailPassword(_emailController.text.trim(),
                        _passwordController.text.trim());
                  },
                  child: Text(
                    'Sign In',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: AppColors.textOnPrimary,
                        ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    final user = await signInWithGoogle();
                    if (user != null && user.user != null) {
                      print("RAJ USER - ${user.user}");
                    } else {
                      if (mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: const Text("Unable to Sign-in with Google"),
                          backgroundColor: AppColors.error,
                        ));
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: AppColors.surface,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: AppColors.border, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    maximumSize: const Size(double.infinity, 56),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/google_logo.png",
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(
                            Icons.login,
                            size: 30,
                            color: AppColors.primary,
                          );
                        },
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Continue with Google',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: AppColors.textPrimary,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ],
                  ),
                ),
                // const SizedBox(height: 20),
                // ElevatedButton(
                //   onPressed: () {
                //     setState(() {
                //       phoneClicked = true;
                //     });
                //   },
                //   style: ElevatedButton.styleFrom(
                //     elevation: 0,
                //     backgroundColor: AppColors.surface,
                //     shape: RoundedRectangleBorder(
                //       side: BorderSide(color: AppColors.border, width: 1),
                //       borderRadius: BorderRadius.circular(10),
                //     ),
                //     padding: const EdgeInsets.symmetric(
                //         vertical: 15, horizontal: 20),
                //     maximumSize: const Size(double.infinity, 56),
                //   ),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       Icon(
                //         Icons.phone,
                //         size: 24,
                //         color: AppColors.primary,
                //       ),
                //       const SizedBox(width: 10),
                //       Text(
                //         'Continue with Phone Number',
                //         style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                //               color: AppColors.textPrimary,
                //               fontWeight: FontWeight.w600,
                //             ),
                //       ),
                //     ],
                //   ),
                // ),
              // ] else ...[
                // Phone Authentication Section
                // TextField(
                //   controller: _phoneController,
                //   enabled: !codeSent,
                //   // Disable phone input after code is sent
                //   style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                //         color: codeSent
                //             ? AppColors.textDisabled
                //             : AppColors.textPrimary,
                //       ),
                //   decoration: InputDecoration(
                //     hintText: 'Enter Phone Number (+1234567890)',
                //     hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                //           color: AppColors.textDisabled,
                //         ),
                //     filled: true,
                //     fillColor: AppColors.surface,
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(10),
                //       borderSide: BorderSide.none,
                //     ),
                //     contentPadding: const EdgeInsets.symmetric(
                //         horizontal: 20, vertical: 15),
                //   ),
                // ),
                // const SizedBox(height: 20),
                // if (!codeSent) ...[
                //   // Show "Send Verification Code" button only if code hasn't been sent
                //   ElevatedButton(
                //     onPressed: _verifyPhoneNumber,
                //     style: AppTheme.primaryButtonStyle(),
                //     child: Text(
                //       'Send Verification Code',
                //       style: Theme.of(context).textTheme.labelLarge?.copyWith(
                //             color: AppColors.textOnPrimary,
                //           ),
                //     ),
                //   ),
                // ] else ...[
                //   // Show SMS code input and related buttons only after code is sent
                //   Text(
                //     'Enter the verification code sent to ${_phoneController.text}',
                //     style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                //           color: AppColors.textSecondary,
                //         ),
                //     textAlign: TextAlign.center,
                //   ),
                //   const SizedBox(height: 20),
                //   TextField(
                //     controller: _smsController,
                //     style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                //           color: AppColors.textPrimary,
                //         ),
                //     decoration: InputDecoration(
                //       hintText: 'Enter SMS Code',
                //       hintStyle:
                //           Theme.of(context).textTheme.bodyLarge?.copyWith(
                //                 color: AppColors.textDisabled,
                //               ),
                //       filled: true,
                //       fillColor: AppColors.surface,
                //       border: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(10),
                //         borderSide: BorderSide.none,
                //       ),
                //       contentPadding: const EdgeInsets.symmetric(
                //           horizontal: 20, vertical: 15),
                //     ),
                //   ),
                //   const SizedBox(height: 20),
                //   ElevatedButton(
                //     onPressed: _signInWithPhoneNumber,
                //     style: AppTheme.primaryButtonStyle(),
                //     child: Text(
                //       'Verify Code',
                //       style: Theme.of(context).textTheme.labelLarge?.copyWith(
                //             color: AppColors.textOnPrimary,
                //           ),
                //     ),
                //   ),
                //   const SizedBox(height: 10),
                //   TextButton(
                //     onPressed: () {
                //       setState(() {
                //         codeSent = false;
                //         _smsController.clear();
                //       });
                //     },
                //     child: Text(
                //       'Resend Code',
                //       style: Theme.of(context).textTheme.labelMedium?.copyWith(
                //             color: AppColors.primary,
                //           ),
                //     ),
                //   ),
                // ],
                // const SizedBox(height: 20),
                // ElevatedButton(
                //   onPressed: () {
                //     setState(() {
                //       phoneClicked = false;
                //       codeSent =
                //           false; // Reset codeSent when switching back to email
                //       _phoneController.clear();
                //       _smsController.clear();
                //     });
                //   },
                //   style: ElevatedButton.styleFrom(
                //     elevation: 0,
                //     backgroundColor: AppColors.surface,
                //     shape: RoundedRectangleBorder(
                //       side: BorderSide(color: AppColors.border, width: 1),
                //       borderRadius: BorderRadius.circular(10),
                //     ),
                //     padding: const EdgeInsets.symmetric(
                //         vertical: 15, horizontal: 20),
                //     maximumSize: const Size(double.infinity, 56),
                //   ),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       Icon(
                //         Icons.email,
                //         size: 24,
                //         color: AppColors.primary,
                //       ),
                //       const SizedBox(width: 10),
                //       Text(
                //         'Login with Email',
                //         style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                //               color: AppColors.textPrimary,
                //               fontWeight: FontWeight.w600,
                //             ),
                //       ),
                //     ],
                //   ),
                // ),
              // ],

              const SizedBox(height: 30),
              TextButton(
                onPressed: () {
                  // Handle Sign Up
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen()));
                },
                child: Text(
                  'Don’t have an account? Sign Up',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: AppColors.textSecondary,
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