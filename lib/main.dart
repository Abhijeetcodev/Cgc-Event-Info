// main.dart file
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'widget/sign_up_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

 
  
  

  // initializing the firebase app
  await Firebase.initializeApp();

  // calling of runApp
  runApp(GoogleSignInX());
}

class GoogleSignInX extends StatefulWidget {
  GoogleSignInX({Key? key}) : super(key: key);
  @override
  _GoogleSignInState createState() => _GoogleSignInState();
}

class _GoogleSignInState extends State<GoogleSignInX> {
  @override
  Widget build(BuildContext context) {
    // we return the MaterialApp here ,
    // MaterialApp contain some basic ui for android ,
    return MaterialApp(
      //materialApp title
      debugShowCheckedModeBanner: false,
      // home property contain SignInScreen widget
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/pattern.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: SignInScreen(),
        ),
      ),
    );
  }
}
