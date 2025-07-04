// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:wardrobe/screens/login_screen.dart';
// import 'package:wardrobe/screens/screen_layout.dart';
// import 'package:wardrobe/widgets/textfields.dart';

// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({super.key});

//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen> {
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final bool _isLoading = false;
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   @override
//   void dispose() {
//     super.dispose();
//     _nameController.dispose();
//     _passwordController.dispose();
//     _emailController.dispose();
//   }

//   void createUser() async {
//     String username = _nameController.text;
//     String password = _passwordController.text;
//     String email = _emailController.text;

//     UserCredential cred = await _auth.createUserWithEmailAndPassword(
//         email: email, password: password);

//     if (username.isNotEmpty || password.isNotEmpty || email.isNotEmpty) {
//       await FirebaseFirestore.instance
//           .collection('Users')
//           .doc(cred.user!.uid)
//           .set({
//         'Username': username,
//         'email': email,
//         'password': password,
//         'uid': cred.user!.uid,
//       });
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (context) {
//             return ScreenLayout();
//           },
//         ),
//       );
//     } else {
//       print('error');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.purple[50],
//         body: Container(
//           padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.1,
//               ),
//               SvgPicture.asset(
//                 'assets/title.svg',
//                 color: Colors.black,
//                 height: 50,
//               ),
//               SizedBox(),
//               SizedBox(),
//               SizedBox(),
//               Text(
//                 'Create your user now!',
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//               ),
//               SizedBox(),
//               SizedBox(
//                 height: 175,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     TextfieldsInput(
//                       textEditingController: _nameController,
//                       hintText: 'Enter your username',
//                       textInputType: TextInputType.text,
//                     ),

//                     TextfieldsInput(
//                       textEditingController: _emailController,
//                       hintText: 'Enter your email',
//                       textInputType: TextInputType.emailAddress,
//                     ),

//                     //password
//                     TextfieldsInput(
//                       textEditingController: _passwordController,
//                       hintText: "Set a password",
//                       textInputType: TextInputType.text,
//                       isPass: true,
//                     ),
//                   ],
//                 ),
//               ),
//               InkWell(
//                 onTap: createUser,
//                 child: Container(
//                   child: _isLoading
//                       ? const Center(
//                           child: CircularProgressIndicator(
//                             color: Colors.white,
//                           ),
//                         )
//                       : Text('Create user!'),
//                   width: double.infinity,
//                   alignment: Alignment.center,
//                   padding: EdgeInsets.symmetric(vertical: 12),
//                   decoration: ShapeDecoration(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.all(
//                         Radius.circular(4),
//                       ),
//                     ),
//                     color: Color.fromARGB(255, 232, 146, 190),
//                   ),
//                 ),
//               ),
//               const SizedBox(),
//               const SizedBox(),
//               const SizedBox(),
//               SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.005,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text(
//                     'Already have an account?',
//                     style: TextStyle(fontSize: 16),
//                   ),
//                   InkWell(
//                     onTap: () {
//                       Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(builder: (context) {
//                           return LoginScrenn();
//                         }),
//                       );
//                     },
//                     child: Text(
//                       'Login!',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 16,
//                         color: Theme.of(context).colorScheme.primary,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
