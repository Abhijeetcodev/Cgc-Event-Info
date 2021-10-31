import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cgc_landran_information/Page/home_page.dart';
import 'package:cgc_landran_information/main.dart';

bool Admin = true;

class SignInScreen extends StatefulWidget {
  SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.black87,
    primary: Colors.grey[300],
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16),

    //IconFaIcon(FontAwesomeIcons.google),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Container(
        //width: 300,
        //height: 300,
        padding: EdgeInsets.all(10.0),
        //color: Colors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "WELCOME CGCIANS ",
                    style: TextStyle(
                      backgroundColor: Colors.white70,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Image.asset('assets/images/wave_hand.png',
                      width: 50, height: 50, fit: BoxFit.fill),
                ],
              ),
            ),
            Container(
              width: 300,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () {
                  signup(context);
                },
                style: OutlinedButton.styleFrom(
                    // elevation: 4,
                    //primary: Colors.white,
                    shape: StadiumBorder(),
                    padding: EdgeInsets.all(10)),
                icon: FaIcon(FontAwesomeIcons.google, color: Colors.redAccent),
                label: Text(
                  "Sign In With Google",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      
    ),);
  }
}

// function to implement the google signin

// creating firebase instance
final FirebaseAuth auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();
Future<void> signup(BuildContext context) async {
  final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
  if (googleSignInAccount != null &&
      (googleSignIn.currentUser?.email.contains('cec@cgc.edu.in') == true ||
          googleSignIn.currentUser?.email
                  .contains('dailytechanalysiss@gmail.com') ==
              true)) {
    if (googleSignIn.currentUser?.email.contains('cec@cgc.edu.in') == true) {
        Admin = false;
      
        
    }else{
        final snackBar = SnackBar(content: Center(child: Text("ADMIN LOGIN",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),),
        ));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
       Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
    final AuthCredential authCredential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    // Getting users credential
    UserCredential result = await auth.signInWithCredential(authCredential);
    //User user? = result.user ;

    if (result != null) {
      final snackBar = SnackBar(content: Text("Succesfully Logged In"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } // if result not null we simply call the MaterialpageRoute,
    // for go to the HomePage screen
  } else {
    if (googleSignInAccount != null ) {
      googleSignIn.signOut();
      final snackBar = SnackBar(
          content: Text("Sorry, Only Collage Registered Ids Are Allowed"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}

//Function to logout

Future<void> signOutMethod() async {
  await auth.signOut();
  await googleSignIn.signOut();
}
