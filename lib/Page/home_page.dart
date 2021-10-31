import 'package:cgc_landran_information/widget/sign_up_widget.dart';
import 'package:flutter/material.dart';
import 'package:cgc_landran_information/Database/read_from_db.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cgc_landran_information/Page/Add_Event.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _signOut() async {
    await _auth.signOut();
  }

  var firestoreDb = FirebaseFirestore.instance.collection('Events').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Visibility(
          visible: Admin,
          child: Text("CREATE EVENT")),
        actions: [
          IconButton(
              onPressed: () {
                signOutMethod();
                Admin = true;

                Navigator.pop(context);
              },
              icon: FaIcon(FontAwesomeIcons.signOutAlt))
        ],
      ),
      floatingActionButton: Visibility(
        visible: Admin,
        child: FloatingActionButton(
            child: FaIcon(FontAwesomeIcons.pen),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AddEvent()));
            }),
      ),
      body: UserInformation(),
    );
  }
}
