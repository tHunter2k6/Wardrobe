// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:wardrobe/hive/hive_methods.dart';
// import 'package:wardrobe/screens/screen_layout.dart';
// import 'package:wardrobe/screens/signup_screen.dart';
// import 'package:wardrobe/widgets/textfields.dart';

// class LoginScrenn extends StatefulWidget {
//   const LoginScrenn({super.key});

//   @override
//   State<LoginScrenn> createState() => _LoginScrennState();
// }

// class _LoginScrennState extends State<LoginScrenn> {
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   bool _isLoading = false;
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   @override
//   void dispose() {
//     super.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//   }

//   void login() async {
//     setState(() {
//       _isLoading = true;
//     });
//     String res = await loginUser(
//         email: _emailController.text, password: _passwordController.text);
//     if (res == "Success") {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (context) {
//             return ScreenLayout();
//           },
//         ),
//       );
//     }
//   }
//   // else {showSnackBar}

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.purple[50],
//         body: Center(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height * 0.05,
//                 ),
//                 SvgPicture.asset(
//                   'assets/title.svg',
//                   color: Colors.black,
//                   height: 50,
//                 ),
//                 SizedBox(),
//                 SizedBox(),
//                 const Text(
//                   'Login to your account!',
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//                 ),
//                 SizedBox(
//                   height: 110,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       TextfieldsInput(
//                         textEditingController: _emailController,
//                         hintText: 'Enter your email',
//                         textInputType: TextInputType.emailAddress,
//                       ),

//                       //password
//                       TextfieldsInput(
//                         textEditingController: _passwordController,
//                         hintText: "Enter your password",
//                         textInputType: TextInputType.text,
//                         isPass: true,
//                       ),
//                     ],
//                   ),
//                 ),
//                 InkWell(
//                   onTap: login,
//                   child: Container(
//                     width: double.infinity,
//                     alignment: Alignment.center,
//                     padding: const EdgeInsets.symmetric(vertical: 12),
//                     decoration: const ShapeDecoration(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.all(
//                           Radius.circular(4),
//                         ),
//                       ),
//                       color: Color.fromARGB(255, 232, 146, 190),
//                     ),
//                     child: _isLoading
//                         ? const Center(
//                             child: CircularProgressIndicator(
//                               color: Colors.white,
//                             ),
//                           )
//                         : const Text('Login!'),
//                   ),
//                 ),
//                 SizedBox(),
//                 SizedBox(),
//                 SizedBox(),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text(
//                       'Dont have an account?',
//                       style: TextStyle(fontSize: 16),
//                     ),
//                     SizedBox(
//                       width: 5,
//                     ),
//                     InkWell(
//                       onTap: () {
//                         Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) {
//                               return const SignUpScreen();
//                             },
//                           ),
//                         );
//                       },
//                       child: Text(
//                         'Register.',
//                         style: TextStyle(
//                           color: Theme.of(context).colorScheme.primary,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
