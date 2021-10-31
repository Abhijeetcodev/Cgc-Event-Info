import 'package:cgc_landran_information/Database/read_from_db.dart';
import 'package:flutter/material.dart';
import 'package:cgc_landran_information/Page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cgc_landran_information/Page/Event_add_class.dart';

class UpdateEvent extends StatefulWidget {
  const UpdateEvent({Key? key}) : super(key: key);

  @override
  _UpdateEventState createState() => _UpdateEventState();
}

class _UpdateEventState extends State<UpdateEvent> {
  TextEditingController  eventTilteInputController = TextEditingController(text: event.titleEventfun);
  
TextEditingController eventDiscriptionInputController = TextEditingController(text: event.discriptionfun);

TextEditingController eventDateInputController =  TextEditingController(text: event.dateofEventfun);

  
   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Center(
          child: Text(" FILL OUT THE FORM TO UPDATE ",
              style: TextStyle(fontSize: 15,fontWeight:FontWeight.bold ),
              ),
        ),
           
        backgroundColor: Colors.blue,
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  eventTilteInputController.clear();
                  eventDateInputController.clear();
                  eventDiscriptionInputController.clear();
                },
                child: Icon(
                  Icons.delete,
                  size: 26.0,
                ),
              )),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        
        child: Column(

          children: [
             SizedBox(height: 5,),
           
          
                TextField(
                
                autofocus: true,
                
                autocorrect: true,
                decoration: InputDecoration(
                    labelText: "Event Name",
                border: OutlineInputBorder(
                  

                ),
                 
                hintText: 'Enter The Event Name',  
                ),
                controller: eventTilteInputController,
                maxLength: 20,
                
                
              ),
                  
              SizedBox(height: 5,),
              Container(
                height:  150,  
                child: Expanded(
                  
                  child: TextField(
                  autofocus: true,
                  autocorrect: true,
                  maxLines: 10,
                  decoration: InputDecoration(labelText: "Event Description",
                  border: OutlineInputBorder(),
                  hintText: 'Description',),
                  controller: eventDiscriptionInputController,
                  maxLength: 500,
                  minLines: 1,
                ),
            ),
            
              ),
              SizedBox(height: 5,),
            
            TextField(
              autofocus: true,
              autocorrect: true,
              decoration: InputDecoration(labelText: "Event date",
              border: OutlineInputBorder(),
               
              hintText: 'Enter The Event Date',  
              ),
              controller: eventDateInputController,
              maxLength: 15,
            ),
            SizedBox(height:5,),            
            ElevatedButton(
                onPressed: () {
                  if (eventDateInputController.text.isNotEmpty &&
                      eventDiscriptionInputController.text.isNotEmpty &&
                      eventTilteInputController.text.isNotEmpty) {
                    FirebaseFirestore.instance
                        .collection("user")
                        .doc(event.idOfEventfun)
                        .update({
                      "title": eventTilteInputController.text,
                      "description": eventDiscriptionInputController.text,
                      "date": eventDateInputController.text,
                    }).then((value) {
                      Navigator.pop(context);
                      eventTilteInputController.clear();
                      eventDateInputController.clear();
                      eventDiscriptionInputController.clear();
                    }).catchError((onError) => print(onError));
                  }
                },
                child: Text("Upadte")),
                
          ],
        ),
      ),
    );
  }
}

