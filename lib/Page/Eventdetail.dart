import 'package:cgc_landran_information/Database/read_from_db.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Event_add_class.dart';
import 'package:expandable/expandable.dart';

class Eventdetails extends StatelessWidget {
  const Eventdetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Container(
          color: Colors.blue,
          child: Column(
            children: [
              SizedBox(height: 10),
              Center(
                child: Text(
                  event.titleEventfun.toUpperCase(),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 150,
                decoration: BoxDecoration(
                    color: Colors.green,
                    image: DecorationImage(
                      image: AssetImage("assets/images/colorful.jpg"),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: Card(
                  child: Image.asset(
                    'assets/images/audience.jpg',
                    fit: BoxFit.cover,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 10,
                  margin: EdgeInsets.all(10),
                ),
              ),
              SizedBox(
                height: 10,
              ),
             
                  Container(
                    
                    decoration: BoxDecoration(
                        color: Colors.pinkAccent,
                        image: DecorationImage(
                          image: AssetImage("assets/images/workplace.jpg"),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(8)),
                    height: 500,
                    padding: EdgeInsets.all(8.0),
                    child: Card(
                       color: Colors.white54,
                       elevation: 10,
                  margin: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                event.discriptionfun,
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                        ],
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

Container MyContainer() {
  return Container(
    width: 300,
    height: 400,
    child: Column(children: [
      Center(
        child: Text(
          event.titleEventfun,
          textScaleFactor: 1.5,
        ),
      ),
      Expanded(
        child: Text(event.discriptionfun),
      ),
      Text(event.dateofEventfun),
    ]),
  );
}
